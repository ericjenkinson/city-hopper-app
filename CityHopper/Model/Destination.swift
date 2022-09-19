//
//  Destination.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/29/22.
//

import Foundation

class Destination: ObservableObject {
  @Published var cities: [City] = []
  
  init(loadTestData: Bool = false) {
    cities.append(City(name: "Munich", image: "imageMunich", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00))
    cities.append(City(name: "Cairo", image: "imageCairo", country: "Egypt", description: "Pyramids!!", reviews: [Review(id: UUID(), rating: 4.3, description: "Great!")], price: 1600.00))
    cities.append(City(name: "Toronto", image: "imageToronto", country: "Canada", description: "Maple Syrup", reviews: [Review(id: UUID(), rating: 3.3, description: "Great!")], price: 1000.00))
    cities.append(City(name: "Florence", image: "imageFlorence", country: "Italy", description: "The Great Masters", reviews: [Review(id: UUID(), rating: 5.0, description: "Wonderful!")], price: 2000.00))
    cities.append(City(name: "Chicago", image: "imageChicago", country: "United States", description: "The Great Masters", reviews: nil, price: 900.00))
    cities.append(City(name: "Tokyo", image: "imageTokyo", country: "Japan", description: "Samurai", reviews: [Review(id: UUID(), rating: 4.1, description: "Wonderful!")], price: 2400.00))
    
    cities.append(City(name: "Berlin", image: "imageBerlin", country: "Germany", description: "Ich bin ein Berliner", reviews: nil, price: 1200.00))
    cities.append(City(name: "Denver", image: "imageDenver", country: "United States", description: "Mile High!", reviews: [Review(id: UUID(), rating: 4.3, description: "Great!")], price: 1600.00))
    cities.append(City(name: "London", image: "imageLondon", country: "United Kingdom", description: "Bangers and Mash!", reviews: [Review(id: UUID(), rating: 3.3, description: "Great!")], price: 1000.00))
    cities.append(City(name: "Los Angeles", image: "imageLosAngeles", country: "United States", description: "Hollywood1", reviews: [Review(id: UUID(), rating: 5.0, description: "Wonderful!")], price: 2000.00))
    cities.append(City(name: "Santorini", image: "imageSantorini", country: "Greece", description: "Blue", reviews: nil, price: 900.00))
    cities.append(City(name: "Paris", image: "imageParis", country: "France", description: "Croissants!", reviews: [Review(id: UUID(), rating: 4.1, description: "Wonderful!")], price: 2400.00))
    cities.append(City(name: "San Francisco", image: "imageSanFrancisco", country: "United States", description: "", reviews: nil, price: 900.00))
    cities.append(City(name: "St. Louis", image: "imageStLouis", country: "United State", description: "The Great Arch", reviews: [Review(id: UUID(), rating: 4.1, description: "Wonderful!")], price: 2400.00))
  }
  
  func add(city: City) {
    cities.append(city)
  }
  
  func getReviews(for city: City) -> [Review]? {
    city.reviews ?? nil
  }
  
  func getCountries() -> [String] {
    var countries = [String]()
    cities.forEach {
      if !countries.contains($0.country) {
        countries.append($0.country)
      }
    }
    return countries
  }
  
}
