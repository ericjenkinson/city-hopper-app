//
//  TripListTab.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/23/22.
//

import SwiftUI

struct TripListTab: View {
  @Binding var trips: [Trip]
  @State var addingNewTrip = false
  
  var body: some View {
    VStack {
      List(trips, id: \.id) { trip in
        Text(trip.name)
      }
      Button(action: {
        withAnimation {
          self.addingNewTrip.toggle()
        }
      }) {
        ButtonText(text: "Add New Trip")
          
      }.sheet(isPresented: $addingNewTrip) {
        NewTripView()
      }
      Spacer()
    }
  }
}

struct TripListTab_Previews: PreviewProvider {
  static private var trips = Binding.constant([Trip(id: UUID(), appUserId: UUID(), name: "Trip to Munich", date: Date(), members: 1, cities: [City(name: "Munich", image: "imageMunich", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00)])])
  
  static var previews: some View {
    TripListTab(trips: trips)
  }
}
