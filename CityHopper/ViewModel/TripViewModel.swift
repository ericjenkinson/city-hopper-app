//
//  TripViewController.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/23/22.
//

import Foundation

///// Information detailing a trip.
//struct Trip {
//  let id = UUID()
//  let appUserId: UUID?
//  var name = Constants.AppData.defaultTripName
//  var date = Date()
//  var members = Group()
//  var cities: [City] = []
//}


class TripViewModel: ObservableObject {
  @Published var trips: [Trip] = []
  
  init(loadTestData: Bool = false) {
    trips.append(Trip(appUserId: UUID(), name: "Trip to Munich", date: Date(), members: Group(members: [Person(firstName: "Eric", lastName: "Jenkinson", age: 54)]), cities: [City(name: "Munich", image: "imageMunich", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00)]))
  }
  
  public func createTrip() {
    
  }
}


