//
//  User.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/21/22.
//

import Foundation

/// The AppUser object holds basic details of the application user including
/// all trips, reviews, and likes
struct AppUser {
  let id: UUID
  var firstName: String?
  var lastName: String?
  var age: Int?
  var email: String?
  var likes: [City]?
  var trips: [Trip] = []
  var reviews: [Review]?
}
