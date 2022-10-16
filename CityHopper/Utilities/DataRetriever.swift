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
final class DataRetriever: NSObject, ObservableObject {
  // MARK: - Private Properties
  let persistenceController = PersistenceController.shared
  private let session: URLSession
  private let sessionConfiguration: URLSessionConfiguration
  private let triposoAccount: String?
  private let triposoToken: String?
  // swiftlint:disable:next line_length
  private let triposoLocationURLString = "https://www.triposo.com/api/20220705/location.json?fields=id,name,country_id,score,coordinates,images,generated_intro&count=50&type=city"

  private var locationPlist = URL(fileURLWithPath: "Location",
                            relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("plist")
  private var locationPlistBinary = URL(fileURLWithPath: "Location",
                            relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("binary")

  // MARK: - Published Properties
  @Published var locationData: TriposoLocation?
  @Published var locationJSON = URL(fileURLWithPath: "Location",
                           relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")
  var locationDataPlist: TriposoLocation?

  // MARK: - Initialization
  override init() {
    self.sessionConfiguration = URLSessionConfiguration.default
    self.session = URLSession(configuration: sessionConfiguration)
    self.triposoAccount = Bundle.main.object(forInfoDictionaryKey: "TRIPOSO_ACCOUNT") as? String
    self.triposoToken = Bundle.main.object(forInfoDictionaryKey: "TRIPOSO_TOKEN") as? String
    super.init()
    self.createAppDirectory()
  }

  // MARK: - Methods
  private func createAppDirectory() {
    let appDocumentLocation = FileManager.documentsDirectoryURL.appendingPathComponent("CityHopper")

    do {
      if !FileManager.default.fileExists(atPath: appDocumentLocation.path) {
        try FileManager.default.createDirectory(at: appDocumentLocation, withIntermediateDirectories: false)
      }
      locationJSON = URL(fileURLWithPath: "Location",
                         relativeTo: appDocumentLocation).appendingPathExtension("json")
      locationPlist = URL(fileURLWithPath: "Location",
                                relativeTo: appDocumentLocation).appendingPathExtension("plist")
      locationPlistBinary = URL(fileURLWithPath: "Location",
                                relativeTo: appDocumentLocation).appendingPathExtension("binary")
    } catch {
      print(error)
    }
  }

  /// Throws an error if the HTTPURLResponse could not be created or it the
  /// the status code indicates an error
  private func getResponseStatus(for response: URLResponse) throws {
    guard let httpResponse = response as? HTTPURLResponse else {
      print("Error encountered: \(HTTPErrorCode.couldNotCreateURLResponse.message)")
      throw HTTPErrorCode.couldNotCreateURLResponse
    }
    for code in HTTPErrorCode.allCases {
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

  func saveJSON() {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted

    do {
      let locationData = try encoder.encode(locationData)

      try locationData.write(to: locationJSON, options: .atomicWrite)
    } catch let error {
      print(error)
    }
  }

  func savePlist() {
    let encoder = PropertyListEncoder()
    encoder.outputFormat = .xml

    do {
      let locationData = try encoder.encode(locationData)

      try locationData.write(to: locationPlist, options: .atomicWrite)
    } catch let error {
      print(error)
    }
  }

  func savePlistBinary() {
    let encoder = PropertyListEncoder()
    encoder.outputFormat = .binary

    do {
      let locationData = try encoder.encode(locationData)

      try locationData.write(to: locationPlistBinary, options: .atomicWrite)
    } catch let error {
      print(error)
    }
  }

  func loadPlist() {
    guard FileManager.default.fileExists(atPath: locationPlist.path) else {
      return
    }

    let decoder = PropertyListDecoder()

    do {
      let locationData = try Data(contentsOf: locationPlist)
      locationDataPlist = try decoder.decode(TriposoLocation.self, from: locationData)
    } catch let error {
      print(error)
    }
    print(locationDataPlist!)
  }

  func getData() async throws {

    // get url
    guard let url = URL(string: triposoLocationURLString) else {
      print("Error encountered (DataRetriever.getData(): \(HTTPErrorCode.invalidURL.message)")
      throw HTTPErrorCode.invalidURL
    }

    let urlRequest = getURLRequest(for: url)

    // swiftlint:disable:next force_try
    let (data, response) = try! await session.data(for: urlRequest)

    do {
      try getResponseStatus(for: response)
    } catch let error {
      print("Error encountered: \(error.localizedDescription)")
      throw error
    }

    let jsonDecoder = JSONDecoder()

    do {
      locationData = try jsonDecoder.decode(TriposoLocation.self, from: data)
    } catch let error {
      print(error)
    }

    saveJSON()
    savePlist()
    savePlistBinary()
    // loadPlist()
    await persistJSON()
  }

  private func getImage(at url: String) async throws -> Data {
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
      throw error
    }
    return data
  }

  func persistJSON() async {
    guard let locations = locationData?.results else {
      return
    }

    for location in locations {
      print("\(location.name) image: \(location.images[0].sizes.original.url)")
      let newRow = Location(context: persistenceController.container.viewContext)
      newRow.id = location.id
      newRow.name = location.name
      newRow.country = location.countryID
      newRow.intro = location.generatedIntro
      newRow.price = Double(location.price)
      newRow.score = location.score
      newRow.latitude = location.coordinates.latitude
      newRow.longitude = location.coordinates.longitude
      do {
        newRow.image = try await getImage(at: location.images[0].sizes.original.url)
      } catch let error {
        print("Error encountered: \(error.localizedDescription)")
      }
    }
    // save the row
    do {
      try persistenceController.container.viewContext.save()
    } catch {
      let nserror = error as NSError
      fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    }
  }
}
