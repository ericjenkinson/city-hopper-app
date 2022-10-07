//
//  DataDownloader.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/7/22.
//

import Foundation

/// DataDownloader contains all of the functionality to download data from the Tripso API.
class DataDownloader {
  
  /// properties
  private let session: URLSession
  private let sessionConfiguration: URLSessionConfiguration
  private let tripsoAccount: String?
  private let tripsoToken: String?
  
  /// initialization
  init() {
    self.sessionConfiguration = URLSessionConfiguration.default
    self.session = URLSession(configuration: sessionConfiguration)
    self.tripsoAccount = Bundle.main.object(forInfoDictionaryKey: "TRIPSO_ACCOUNT") as? String
    self.tripsoToken = Bundle.main.object(forInfoDictionaryKey: "TRIPSO_TOKEN") as? String
  }
  
  /// methods
  
}
