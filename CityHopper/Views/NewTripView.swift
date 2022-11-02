//
//  NewTripView.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/24/22.
//

import SwiftUI

struct NewTripView: View {
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  @EnvironmentObject var tripsVM: TripsViewModel
  @EnvironmentObject var locationVM: LocationViewModel

  @State private var tripName: String = ""
  @State private var tripDate: Date = Date()
  @State private var selectedCity = ""
  @State private var groupSize = 1
  @State private var firstName = ""
  @State private var lastName = ""

  var pricePerPerson: String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency

    let price = locationVM.priceFor(location: selectedCity)

    return formatter.string(from: NSNumber(value: price)) ?? "$0"
  }
  var totalCost: String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency

    let price = locationVM.priceFor(location: selectedCity) * Double(groupSize)
    return formatter.string(from: NSNumber(value: price)) ?? "$0"
  }

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Trip Info")) {
          TextField("Trip Name", text: $tripName)
          DatePicker("Trip Date", selection: $tripDate, displayedComponents: .date)
        }
        Section(header: Text("Cities")) {
          Picker("City", selection: $selectedCity) {
            ForEach(locationVM.getLocationNames(), id: \.self) {
              Text($0)
            }
          }
        }
        Section(header: Text("Group")) {
          Stepper("Group size: \(groupSize)", value: $groupSize, in: 1...20)
          Text("Cost per person: \(pricePerPerson)")
          Text("Total cost: \(totalCost)")
        }
        Section {
          Button(action: {
            withAnimation {
              tripsVM.newTrip(tripName: tripName,
                              tripDate: tripDate,
                              tripCity: selectedCity,
                              groupSize: Int64(groupSize),
                              costPerPerson: Double(pricePerPerson) ?? 0.0,
                              totalCost: Double(totalCost) ?? 0.0,
                              tripTaken: false)
              self.mode.wrappedValue.dismiss()
            }
          }, label: {
            Text("Save Trip")
          })
          .disabled(tripName.isEmpty || selectedCity.isEmpty)
        }
      }
      .navigationTitle("Create a new Trip")
    }
  }
}

struct NewTripView_Previews: PreviewProvider {
  static var previews: some View {
    NewTripView()
  }
}
