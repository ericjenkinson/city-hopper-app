//
//  TripViewController.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/23/22.
//

import Foundation

///// Information detailing a trip.
class TripViewModel: ObservableObject {
  @Published var trips: [Trip] = []
  
  init(loadTestData: Bool = false) {
    if loadTestData {
      trips.append(Trip(appUserId: UUID(), name: "Trip to Munich", date: Date(), members: Group(members: [Person(firstName: "Eric", lastName: "Jenkinson", age: 54)]), cities: [City(name: "Munich", image: "imageMunich", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00)]))
      trips.append(Trip(appUserId: UUID(), name: "Bay Trip", date: Date(), members: Group(members: [Person(firstName: "Eric", lastName: "Jenkinson", age: 54)]), cities: [City(name: "San Francisco", image: "imageSanFrancisco", country: "United States", description: "", reviews: nil, price: 900.00)]))
      trips.append(Trip(appUserId: UUID(), name: "Across the US", date: Date(), members: Group(members: [Person(firstName: "Eric", lastName: "Jenkinson", age: 54)]), cities: [City(name: "Denver", image: "imageDenver", country: "United States", description: "Mile High!", reviews: [Review(id: UUID(), cityId: UUID(), appUserId: UUID(), rating: 4.3, description: "Great!")], price: 1600.00), City(name: "San Francisco", image: "imageSanFrancisco", country: "United States", description: "", reviews: nil, price: 900.00), City(name: "St. Louis", image: "imageStLouis", country: "United State", description: "The Great Arch", reviews: [Review(id: UUID(), cityId: UUID(), appUserId: UUID(), rating: 4.1, description: "Wonderful!")], price: 2400.00)]))
    }
  }
  
  public func createTrip() {
    
  }
}



