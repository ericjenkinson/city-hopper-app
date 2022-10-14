//
//  DataDownloader.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/13/22.
//

import Foundation
import SwiftUI

final class DataDownloader: NSObject, ObservableObject {
  // MARK: Published Properties
  @Published var downloadLocation: URL?
  @Published var downloadProgress: Float = 0

  // MARK: Static Properties
  static let BackgroundDataDownloadDidFinish =
  NSNotification.Name(rawValue: "BackgroundDataDownloadDidFinish")

  // MARK: Properties
  private var downloadURL: URL?
  private var downloadTask: URLSessionDownloadTask?
  private var session: URLSession!

  var state: State = .waiting

}
