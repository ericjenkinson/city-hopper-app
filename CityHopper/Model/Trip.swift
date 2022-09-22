//
//  Trip.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/28/22.
//

import Foundation
import SwiftUI

/// Information detailing a trip. 
struct Trip {
  let id: UUID
  let appUserId: UUID
  let name: String
  let date: Date
  var members: Group
  var cities: [City]
  var images: [Image]?
}
