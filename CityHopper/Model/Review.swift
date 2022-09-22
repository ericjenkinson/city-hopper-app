//
//  Review.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/28/22.
//

import Foundation

struct Review {
  let id: UUID
  let tripId: UUID
  let appUserId: UUID
  let rating: Double
  let description: String
}
