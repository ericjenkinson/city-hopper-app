//
//  CityHopperApp.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

@main
struct CityHopperApp: App {
  var body: some Scene {
    WindowGroup {
      HomeScreen().environmentObject(CityViewModel(loadTestData: true))
    }
  }
}
