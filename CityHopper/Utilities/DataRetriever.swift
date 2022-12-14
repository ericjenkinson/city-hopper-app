//
//  DataDownloader.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/7/22.
//

import Foundation
import CoreData
import UIKit

/// DataDownloader contains all of the functionality to download data from the Tripso API.
@MainActor
final class DataRetriever: NSObject, ObservableObject {

  // MARK: - Private Properties
  private let session: URLSession
  private let sessionConfiguration: URLSessionConfiguration
  private let triposoAccount: String?
  private let triposoToken: String?
  // swiftlint:disable:next line_length
  var triposoLocationURLString = "https://www.triposo.com/api/20220705/location.json?fields=id,name,country_id,score,coordinates,images,generated_intro&count=15&type=city"

  // MARK: - Published Properties
  @Published var locationData: TriposoLocation?

  // MARK: - Initialization
  override init() {
    URLCache.shared.memoryCapacity = 50_000_000 // ~50 MB of memory space
    URLCache.shared.diskCapacity = 1_000_000_000 // ~1 GB of disk space
    self.sessionConfiguration = URLSessionConfiguration.default
    self.sessionConfiguration.waitsForConnectivity = true
    self.sessionConfiguration.requestCachePolicy = .reloadRevalidatingCacheData
    self.session = URLSession(configuration: sessionConfiguration)
    self.triposoAccount = Bundle.main.object(forInfoDictionaryKey: "TRIPOSO_ACCOUNT") as? String
    self.triposoToken = Bundle.main.object(forInfoDictionaryKey: "TRIPOSO_TOKEN") as? String
    super.init()
  }

  /// Throws an error if the HTTPURLResponse could not be created or it the
  /// the status code indicates an error
  private func getResponseStatus(for response: URLResponse) throws {
    guard let httpResponse = response as? HTTPURLResponse else {
      print("Error encountered: \(HTTPErrorCode.couldNotCreateURLResponse.message)")
      throw HTTPErrorCode.couldNotCreateURLResponse
    }
    for code in HTTPErrorCode.allCases {
      // swiftlint:disable:next for_where
      if code.code == httpResponse.statusCode, code.isError {
        print("Error encountered: \(code.message)")
        throw code
      }
    }
  }

  private func getURLRequest(for url: URL) -> URLRequest {
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue(triposoAccount, forHTTPHeaderField: "X-Triposo-Account")
    request.setValue(triposoToken, forHTTPHeaderField: "X-Triposo-Token")

    return request
  }

  func getData() async throws {

    // get url
    guard let url = URL(string: triposoLocationURLString) else {
      print("Error encountered (DataRetriever.getData(): \(HTTPErrorCode.invalidURL.message)")
      throw HTTPErrorCode.invalidURL
    }

    let urlRequest = getURLRequest(for: url)

    var response: URLResponse
    var data: Data

    do {
      (data, response) = try await session.data(for: urlRequest)
    } catch let error {
      print("Error encountered: \(error.localizedDescription)")
      throw DataRetrieverErrors.errorGettingData
    }

    do {
      try getResponseStatus(for: response)
    } catch let error {
      print("Error encountered: \(error.localizedDescription)")
      throw DataRetrieverErrors.errorGettingResponse
    }

    let jsonDecoder = JSONDecoder()

    do {
      let parsedJSON = try jsonDecoder.decode(TriposoLocation.self, from: data)
      await MainActor.run {
        locationData = parsedJSON
      }
    } catch let error {
      print(error)
    }

    try await saveJSONtoCoreData()
  }

  func getImage(at url: String) async throws -> Data {
    guard let imageURL = URL(string: url) else {
      print("Error encountered (DataRetriever.getData(): \(HTTPErrorCode.invalidURL.message)")
      throw HTTPErrorCode.invalidURL
    }

    // swiftlint:disable:next force_try
    let (data, response) = try! await session.data(from: imageURL)

    do {
      try getResponseStatus(for: response)
    } catch let error {
      print("Error encountered: \(error.localizedDescription)")
      throw DataRetrieverErrors.errorGettingResponse
    }
    return data
  }

  func saveJSONtoCoreData() async throws {

    guard let locations = locationData?.results else {
      throw DataRetrieverErrors.errorNoLocationsToPersist
    }

    let viewContext = PersistenceController.shared.container.viewContext
    for location in locations {
      print("\(location.name) image: \(location.images[0].sizes.original.url)")

      let likedCity = LikedCities(context: viewContext)
      likedCity.isLiked = Bool.random()

      Location.createWith(id: location.id,
                          name: location.name,
                          country: location.countryID.replacingOccurrences(of: "_", with: " "),
                          intro: location.generatedIntro ?? "",
                          score: location.score,
                          price: Double(location.price),
                          latitude: location.coordinates.latitude,
                          longitude: location.coordinates.longitude,
                          image: location.images[0].sizes.medium.url.replacingOccurrences(of: "http", with: "https"),
                          in: likedCity,
                          using: viewContext)

    }
  }
}
