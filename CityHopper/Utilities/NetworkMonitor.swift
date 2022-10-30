//
//  NetworkMonitor.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/29/22.
//

import Foundation
import Network

@MainActor
class NetworkMonitor: ObservableObject {
  private let monitor = NWPathMonitor()
  private let queue = DispatchQueue(label: "Monitor")

  @Published var isActive = true
  var isExpensive = false
  var isConstrained = false
  var connectionType = NWInterface.InterfaceType.other

  init() {
    monitor.pathUpdateHandler = { path in
      DispatchQueue.main.async {
        self.isActive = path.status == .satisfied
      }

      self.isExpensive = path.isExpensive
      self.isConstrained = path.isConstrained

      let connectionTypes: [NWInterface.InterfaceType] = [.cellular, .wifi, .wiredEthernet]
      self.connectionType = connectionTypes.first(where: path.usesInterfaceType) ?? .other

      DispatchQueue.main.async {
        self.objectWillChange.send()
      }
    }
    monitor.start(queue: queue)
  }
}
