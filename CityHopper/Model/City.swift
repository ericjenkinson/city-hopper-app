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
}

extension City: Identifiable {
  
}
