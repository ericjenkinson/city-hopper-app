//
//  User.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/21/22.
//

import Foundation

struct AppUser {
  let id: UUID
  let firstName: String
  let lastName: String
  var age: Int
  var likes: [City]?
  var trips: [Trip]?
  var reviews: [Review]?
}
