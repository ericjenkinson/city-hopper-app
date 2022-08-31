//
//  Destination.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/29/22.
//

import Foundation

struct Destination {
  var cities: [City] = []
  
  init(loadTestData: Bool = false) {
    cities.append(City(name: "Munich", image: "pexels-aleksandr-unikovskiy-10505611-Munich.jpg", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00))
    cities.append(City(name: "Cairo", image: "pexels-alex-azabache-3290075-cairo.jpg", country: "Egypt", description: "Pyramids!!", reviews: [Review(id: UUID(), rating: 4.3, description: "Great!")], price: 1600.00))
    cities.append(City(name: "Toronto", image: "pexels-alex-ohan-11675281-toronto.jpg", country: "Canada", description: "Maple Syrup", reviews: [Review(id: UUID(), rating: 3.3, description: "Great!")], price: 1000.00))
    cities.append(City(name: "Florence", image: "pexels-alex-zhernovyi-3822486-florence.jpg", country: "Italy", description: "The Great Masters", reviews: [Review(id: UUID(), rating: 5.0, description: "Wonderful!")], price: 2000.00))
    cities.append(City(name: "Chicago", image: "pexels-cameron-casey-1334605-chicago.jpg", country: "United States", description: "The Great Masters", reviews: nil, price: 900.00))
    cities.append(City(name: "Tokyo", image: "pexels-clyde-thomas-6602635-tokyo.jpg", country: "Japan", description: "Samurai", reviews: [Review(id: UUID(), rating: 4.1, description: "Wonderful!")], price: 2400.00))
  }
  
  mutating func add(city: City) {
    cities.append(city)
  }
  
  func getReviews(for city: City) -> [Review]? {
    city.reviews ?? nil
  }
}
