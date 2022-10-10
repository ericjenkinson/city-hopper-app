//
//  DataDownloader.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/7/22.
//

import Foundation

/// DataDownloader contains all of the functionality to download data from the Tripso API.
class DataRetriever: NSObject {
  
  /// properties
  private let session: URLSession
  private let sessionConfiguration: URLSessionConfiguration
  private let triposoAccount: String?
  private let triposoToken: String?
  
  /// initialization
  override init() {
    self.sessionConfiguration = URLSessionConfiguration.default
    self.session = URLSession(configuration: sessionConfiguration)
    self.triposoAccount = Bundle.main.object(forInfoDictionaryKey: "TRIPOSO_ACCOUNT") as? String
    self.triposoToken = Bundle.main.object(forInfoDictionaryKey: "TRIPOSO_TOKEN") as? String
  }
  
  /// methods
  
  /// Throws an error if the HTTPURLResponse could not be created or it the
  /// the status code indicates an error
  private func getResponseStatus(for response: URLResponse) throws {
    guard let httpResponse = response as? HTTPURLResponse else {
      print("Error encountered: \(HTTPErrorCode.couldNotCreateURLResponse.message)")
      throw HTTPErrorCode.couldNotCreateURLResponse
    }
    for code in HTTPErrorCode.allCases {
      if code.code == httpResponse.statusCode {
        if code.isError {
          print("Error encountered: \(code.message)")
          throw code
        }
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
  
  func getData() async throws -> String {
    
    // get url
    guard let url = URL(string: "https://www.triposo.com/api/20220705/location.json") else {
      print("Error encountered (DataRetriever.getData(): \(HTTPErrorCode.invalidURL.message)")
      throw HTTPErrorCode.invalidURL
    }
    
    let request = getURLRequest(for: url)
    
    let (data, response) = try! await session.data(for: request)
    
    do {
      try getResponseStatus(for: response)
    } catch(let error) {
      print("Error encountered: \(error.localizedDescription)")
      throw error
    }
    
    return "Data downloaded: \(data) bytes"
  }
  
  func getCookies() async -> String {
    var description = ""
    
    guard let url = URL(string: "https://raywenderlich.com") else {
      return "Cookies: N/A"
    }

    do {
      let (_, response) = try await URLSession.shared.data(from: url)

      guard let httpResponse = response as? HTTPURLResponse,
        let fields = httpResponse.allHeaderFields as? [String: String]
      else {
        return "Cookies: N/A"
      }

      let cookies = HTTPCookie.cookies(withResponseHeaderFields: fields, for: url)

      for cookie in cookies {
        description += "\(cookie.name): \(cookie.value)\n"
      }
    } catch {
      return "Cookies: N/A"
    }
    return description
  }
  
}

