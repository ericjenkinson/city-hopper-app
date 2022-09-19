//
//  City.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/28/22.
//

import Foundation

struct City {
  let id = UUID()
  let name: String
  let image: String
  let country: String
  let description: String
  let reviews: [Review]?  
  let price: Double
  let thingsToDo = ["Sight seeing", "Theater", "Shopping", "Museums", "Live Music", "Arts and Crafts", "Theme Parks", "Convention"]
}

extension City: Identifiable {
  
}
