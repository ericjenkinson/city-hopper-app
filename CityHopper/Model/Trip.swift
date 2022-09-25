//
//  Trip.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/28/22.
//

import Foundation
import SwiftUI

/// The Trip object represents a trip to one or more cities. Trip objects
/// are created with the TripBuilder object.
struct Trip {
  let id = UUID()
  let appUserId: UUID?
  var name = Constants.AppData.defaultTripName
  var date = Date()
  var members = Group()
  var cities: [City] = []
}
