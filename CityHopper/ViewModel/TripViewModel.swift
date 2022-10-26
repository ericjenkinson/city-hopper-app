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
      trips.append(Trip(name: "Trip to Munich", date: Date(), members: 1))
      trips.append(Trip(name: "Bay Trip", date: Date(), members: 2))
      trips.append(Trip(name: "Across the US", date: Date(), members: 4))
    }
  }

  public func createTrip() {
  }
}
