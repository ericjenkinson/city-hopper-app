//
//  TripListTab.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/23/22.
//

import SwiftUI

struct TripListTab: View {
  @State var addingNewTrip = false

  @EnvironmentObject var tripsVM: TripsViewModel

  var body: some View {
    VStack {
      if tripsVM.isEmpty() {
        Text("No trips!")
      } else {
        List {
          ForEach(tripsVM.trips, id: \.name) { trip in
            Text(trip.name)
          }
          .onDelete(perform: tripsVM.deleteTrip)
        }
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

// struct TripListTab_Previews: PreviewProvider {
//  static private var trips = Binding.constant([
//    Trip(name: "Trip to Munich", date: Date(), members: 1)])
//
//  static var previews: some View {
//    TripListTab(tripsVM: trips)
//      .environmentObject(TripsViewModel())
//  }
// }
