//
//  TripListTab.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/23/22.
//

import SwiftUI

struct TripListTab: View {
  @Binding var sTrips: [Trip]
  @State var addingNewTrip = false

  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(sortDescriptors: [])
  private var trips: FetchedResults<Trips>

  var body: some View {
    VStack {
      List(sTrips, id: \.name) { trip in
        Text(trip.name)
      }
      Button(action: {
        withAnimation {
          self.addingNewTrip.toggle()
        }
      }, label: {
        ButtonText(text: "Add New Trip")
      }).sheet(isPresented: $addingNewTrip) {
        NewTripView()
      }
      Spacer()
    }
  }
}

struct TripListTab_Previews: PreviewProvider {
  static private var trips = Binding.constant([
    Trip(name: "Trip to Munich", date: Date(), members: 1)])

  static var previews: some View {
    TripListTab(sTrips: trips)
  }
}
