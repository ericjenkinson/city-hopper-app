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
    if loadTestData {
      appUser.firstName = "Eric"
      appUser.lastName = "Jenkinson"
      appUser.age = 54
      appUser.email = "testEmail@gmail.com"
      appUser.trips = [(Trip(name: "Trip to Munich", date: Date(), members: 1)),
                       (Trip(name: "Bay Trip", date: Date(), members: 1)),
                       (Trip(name: "Across the US", date: Date(), members: 1))]
    }
  }
}

extension UserViewModel: TripBuilderDelegate {
  public func buildTripWithPartialData(tripName: String, tripDate: Date, firstName: String, lastName: String) {
    let tripBuilder = TripBuilder()
    tripBuilder.setTripName(to: tripName)
    tripBuilder.setTripDate(to: tripDate)
    tripBuilder.setTripOwner(to: appUser.id)
    tripBuilder.add(members: 1)
    appUser.trips.append(tripBuilder.build())
  }
}
