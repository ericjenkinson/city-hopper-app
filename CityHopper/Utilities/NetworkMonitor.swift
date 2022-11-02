//
//  NetworkMonitor.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/29/22.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
  var isConnected = false

  private let networkMonitor = NWPathMonitor()
  private let workerQueue = DispatchQueue.global()

  init() {
    networkMonitor.pathUpdateHandler = { path in
      self.isConnected = path.status == .satisfied
      Task {
        await MainActor.run {
          self.objectWillChange.send()
        }
      }
    }
    networkMonitor.start(queue: workerQueue)
  }
}
