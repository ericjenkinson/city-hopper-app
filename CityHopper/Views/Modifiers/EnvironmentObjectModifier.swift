//
//  PrevewModifiers.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/24/22.
//

import SwiftUI

struct EnvironmentObjectModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .environmentObject(CityViewModel(loadTestData: true))
      .environmentObject(TripViewModel(loadTestData: true))
      .environmentObject(UserViewModel(loadTestData: true))
  }
}

extension View {
  func environmentObjectModifiers() -> some View {
    modifier(EnvironmentObjectModifier())
  }
}
