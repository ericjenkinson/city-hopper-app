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
    NavigationView {
      VStack {
        if tripsVM.isEmpty() {
          Image("aroundTheWorld")
            .resizable()
            .scaledToFit()
          Spacer()
        } else {
          List {
            ForEach(tripsVM.trips.indices, id: \.self) { index in
              NavigationLink(
                destination: TripDetails(tripIndex: index),
                label: {
                  Text(tripsVM.trips[index].name)

              })
              .listRowBackground(Color.white)
            }
            .onDelete { indexSet in
              tripsVM.deleteTrip(indexSet: indexSet)
            }
          }
          .listStyle(.insetGrouped)
          .animation(.easeOut(duration: 0.33), value: tripsVM.trips)
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
      .navigationTitle("My Trips")
      .padding()
    }
  }
}
