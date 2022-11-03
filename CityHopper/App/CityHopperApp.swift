//
//  CityHopperApp.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

@main
struct CityHopperApp: App {
  // MARK: - Properties

  var body: some Scene {
    WindowGroup {
      HomeScreen()
        .environmentObject(TripsViewModel())
        .environmentObject(LocationViewModel())
        .environmentObject(LikedCitiesViewModel())
        .environmentObject(NetworkMonitor())
    }
  }
}
