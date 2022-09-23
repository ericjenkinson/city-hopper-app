//
//  Person.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/28/22.
//

import Foundation

/// Basic info for a person in the App. Used for group members
struct Person {
  let firstName: String
  let lastName: String
  var age: Int
}

extension Person: Equatable { }
