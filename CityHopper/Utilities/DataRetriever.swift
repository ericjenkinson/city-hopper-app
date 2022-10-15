//
//  DataDownloader.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/7/22.
//

import Foundation

/// DataDownloader contains all of the functionality to download data from the Tripso API.
final class DataRetriever: NSObject, ObservableObject {
  /// properties
  private let session: URLSession
  private let sessionConfiguration: URLSessionConfiguration
  private let triposoAccount: String?
  private let triposoToken: String?
  // swiftlint:disable:next line_length
  private let triposoLocationURLString = "https://www.triposo.com/api/20220705/location.json?fields=id,name,country_id,score,coordinates,images,generated_intro&count=50"
  private var locationJSON = URL(fileURLWithPath: "Location",
                           relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")
  private var locationPlist = URL(fileURLWithPath: "Location",
                            relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("plist")
  private var locationPlistBinary = URL(fileURLWithPath: "Location",
                            relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("binary")
  @Published var locationData: Location?
  var locationDataPlist: Location?

  /// initialization
  override init() {
    self.sessionConfiguration = URLSessionConfiguration.default
    self.session = URLSession(configuration: sessionConfiguration)
    self.triposoAccount = Bundle.main.object(forInfoDictionaryKey: "TRIPOSO_ACCOUNT") as? String
    self.triposoToken = Bundle.main.object(forInfoDictionaryKey: "TRIPOSO_TOKEN") as? String
    super.init()
    self.createAppDirectory()
  }
  /// methods

  private func createAppDirectory() {
    let appDocumentLocation = FileManager.documentsDirectoryURL.appendingPathComponent("CityHopper")
    // check if folder exists then create
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
      locationDataPlist = try decoder.decode(Location.self, from: locationData)
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
      locationData = try jsonDecoder.decode(Location.self, from: data)
    } catch let error {
      print(error)
    }

    saveJSON()
    savePlist()
    savePlistBinary()
    loadPlist()
  }

}
