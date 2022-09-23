//
//  TripListTab.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/23/22.
//

import SwiftUI

struct TripListTab: View {
  let trips: [Trip]
  
  var body: some View {
    List(trips, id: \.id) { trip in
      Text(trip.name)
    }
  }
}

struct TripListTab_Previews: PreviewProvider {
  static private let trips = [Trip(appUserId: UUID(), name: "Trip to Munich", date: Date(), members: Group(members: [Person(firstName: "Eric", lastName: "Jenkinson", age: 54)]), cities: [City(name: "Munich", image: "imageMunich", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00)])]
  
  static var previews: some View {
    TripListTab(trips: trips)
  }
}
