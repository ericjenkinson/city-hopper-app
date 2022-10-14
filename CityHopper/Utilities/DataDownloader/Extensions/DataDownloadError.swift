//
//  DataDownloadError.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/13/22.
//

import Foundation

extension DataDownloader {
  enum DataDownloadError: Error {
    case documentDirectoryError
    case failedToStoreData
    case invalidResponse
  }
}
