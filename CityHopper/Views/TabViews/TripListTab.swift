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
          .onDelete { indexSet in
            tripsVM.deleteTrip(indexSet: indexSet)
          }
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
