//
//  UserViewModel.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/23/22.
//

import Foundation


public class UserViewModel: ObservableObject {
  @Published var appUser: AppUser
  
  var numberOfTrips: Int {
    appUser.trips.count
  }
  
  init(loadTestData: Bool = false) {
    appUser = AppUser(id: UUID())
    appUser.firstName = "Eric"
    appUser.lastName = "Jenkinson"
    appUser.age = 54
    appUser.email = "testEmail@gmail.com"
    appUser.trips = [(Trip(id: UUID(), appUserId: UUID(), name: "Trip to Munich", date: Date(), members: Group(members: [Person(firstName: "Eric", lastName: "Jenkinson", age: 54)]), cities: [City(name: "Munich", image: "imageMunich", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00)])), (Trip(id: UUID(), appUserId: UUID(), name: "Bay Trip", date: Date(), members: Group(members: [Person(firstName: "Eric", lastName: "Jenkinson", age: 54)]), cities: [City(name: "San Francisco", image: "imageSanFrancisco", country: "United States", description: "", reviews: nil, price: 900.00)])), (Trip(id: UUID(), appUserId: UUID(), name: "Across the US", date: Date(), members: Group(members: [Person(firstName: "Eric", lastName: "Jenkinson", age: 54)]), cities: [City(name: "Denver", image: "imageDenver", country: "United States", description: "Mile High!", reviews: [Review(id: UUID(), cityId: UUID(), appUserId: UUID(), rating: 4.3, description: "Great!")], price: 1600.00), City(name: "San Francisco", image: "imageSanFrancisco", country: "United States", description: "", reviews: nil, price: 900.00), City(name: "St. Louis", image: "imageStLouis", country: "United State", description: "The Great Arch", reviews: [Review(id: UUID(), cityId: UUID(), appUserId: UUID(), rating: 4.1, description: "Wonderful!")], price: 2400.00)]))]
    
  }
  
  public func newTripWithPartialData(tripName: String, tripDate: Date, firstName: String, lastName: String) {
    let tripBuilder = TripBuilder()
    tripBuilder.setTripName(to: tripName)
    tripBuilder.setTripDate(to: tripDate)
    tripBuilder.setTripOwner(to: appUser.id)
    tripBuilder.add(person: Person(firstName: firstName, lastName: lastName))
    appUser.trips.append(tripBuilder.build())
    
  }
}
