//
//  Destination.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/29/22.
//

import Foundation

class CityViewModel: ObservableObject {
  @Published var cities: [City] = []

  init(loadTestData: Bool = false) {
    if loadTestData {
      cities.append(City(name: "Munich", image: "imageMunich", country: "Germany",
                         description: "Octoberfest!!", price: 1200.00))
      cities.append(City(name: "Cairo", image: "imageCairo", country: "Egypt",
                         description: "Pyramids!!", price: 1600.00))
      cities.append(City(name: "Toronto", image: "imageToronto", country: "Canada",
                         description: "Maple Syrup", price: 1000.00))
      cities.append(City(name: "Florence", image: "imageFlorence", country: "Italy",
                         description: "The Great Masters", price: 2000.00))
      cities.append(City(name: "Chicago", image: "imageChicago", country: "United States",
                         description: "Deep Dish Pizza!", price: 900.00))
      cities.append(City(name: "Tokyo", image: "imageTokyo", country: "Japan",
                         description: "Samurai", price: 2400.00))
      cities.append(City(name: "New York", image: "imageNewYork", country: "United States",
                         description: "Big Apple!", price: 2400.00))
      cities.append(City(name: "Berlin", image: "imageBerlin", country: "Germany",
                         description: "Ich bin ein Berliner", price: 1200.00))
      cities.append(City(name: "Denver", image: "imageDenver", country: "United States",
                         description: "Mile High!", price: 1600.00))
      cities.append(City(name: "London", image: "imageLondon", country: "United Kingdom",
                         description: "Bangers and Mash!", price: 1000.00))
      cities.append(City(name: "Los Angeles", image: "imageLosAngeles", country: "United States",
                         description: "Hollywood!", price: 2000.00))
      cities.append(City(name: "Santorini", image: "imageSantorini", country: "Greece",
                         description: "Blue", price: 900.00))
      cities.append(City(name: "Paris", image: "imageParis", country: "France",
                         description: "Croissants!", price: 2400.00))
      cities.append(City(name: "San Francisco", image: "imageSanFrancisco", country: "United States",
                         description: "City by the Bay", price: 900.00))
      cities.append(City(name: "St. Louis", image: "imageStLouis", country: "United State",
                         description: "The Great Arch", price: 2400.00))
    }
  }

  func add(city: City) {
    cities.append(city)
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

  func cityNames() -> [String] {
    var names = [String]()
    cities.forEach {
      if !names.contains($0.name) {
        names.append($0.name)
      }
    }
    return names
  }

  func getPrice(cityName: String) -> Double {
    if let city = cities.first(where: { $0.name == cityName}) {
      return (city.price).rounded(toPlaces: 2)
    }
    return Double.zero
  }
}
