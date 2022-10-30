//
//  Binding.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/30/22.
//

import Foundation
import SwiftUI

extension Binding where Value == Bool {
  var not: Binding<Value> {
    Binding<Value>(
      get: { !self.wrappedValue },
      set: { self.wrappedValue = !$0 }
    )
  }
}
