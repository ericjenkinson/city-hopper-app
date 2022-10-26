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
  var name = Constants.AppData.defaultTripName
  var date = Date()
  var city: String?
  var members = 1
  var costPerMember = 0.0
  var totalCost = 0.0
}
