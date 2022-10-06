//
//  NewTripView.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/24/22.
//

import SwiftUI

struct NewTripView: View {
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  @EnvironmentObject var appUser: UserViewModel
  @EnvironmentObject var cities: CityViewModel
  
  @State private var tripName: String = ""
  @State private var tripDate: Date = Date()
  @State private var members: [Person] = []
  @State private var selectedCity = "Munich"
  @State private var groupSize = 1
  @State private var splitBill = false
  @State private var firstName = ""
  @State private var lastName = ""
  
    var body: some View {
      NavigationView {
        Form {
          Section(header: Text("Trip Info")) {
            TextField("Trip Name", text: $tripName)
            DatePicker("Trip Date", selection: $tripDate, displayedComponents: .date)
          }
          Section(header: Text("Cities")) {
            Picker("City", selection: $selectedCity) {
              ForEach(cities.cityNames(), id: \.self) {
                Text($0)
              }
            }
            
          }
          Section(header: Text("Group")) {
            Stepper("Group size: \(groupSize)", value: $groupSize, in: 1...20)
            Toggle("Split costs", isOn: $splitBill)
              .disabled(groupSize == 1)
          }
          Section {
            Button(action: {
              withAnimation {
                appUser.buildTripWithPartialData(tripName: tripName, tripDate: tripDate, firstName: firstName, lastName: lastName)
                self.mode.wrappedValue.dismiss()
              }
            }) {
              Text("Save Trip")
            }
          }
        }
      }
    }
}



struct NewTripView_Previews: PreviewProvider {
  
    static var previews: some View {
        NewTripView()
        .environmentObjectModifiers()
    }
}
