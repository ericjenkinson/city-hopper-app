//
//  Location.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/12/22.
//

import Foundation

import Foundation

struct Location: Codable {
  let results: [LocationResult]
}

struct LocationResult: Codable {
  let id: String
}
