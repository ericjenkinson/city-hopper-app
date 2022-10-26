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
  let persistenceController = PersistenceController.shared

  var body: some Scene {
    WindowGroup {
      HomeScreen()
        .environmentObject(CityViewModel(loadTestData: true))
        .environmentObject(TripsViewModel())
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
  }
}
