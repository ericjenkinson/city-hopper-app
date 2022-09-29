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
  
  @State private var tripName: String = ""
  @State private var tripDate: Date = Date()
  @State private var members: [Person] = []
  @State private var cities = ""
  @State private var firstName = ""
  @State private var lastName = ""
  
    var body: some View {
      Form {
        Section(header: Text("Trip Info")) {
          TextField("Trip Name", text: $tripName)
          DatePicker("Trip Date", selection: $tripDate, displayedComponents: .date)
        }
        Section(header: Text("Cities")) {
          TextField("1st CIty", text: $cities)
          
        }
        Section(header: Text("Group")) {
          TextField("First Name", text: $firstName)
          TextField("Last Name", text: $lastName)
        }
        Section {
          Button(action: {
            withAnimation {
              appUser.buildTripWithPartialData(tripName: tripName, tripDate: tripDate, firstName: firstName, lastName: lastName)
              self.mode.wrappedValue.dismiss()
            }
          }) {
            ButtonText(text: "Save Trip!")
          }
        }
      }
    }
}



struct NewTripView_Previews: PreviewProvider {
  
    static var previews: some View {
        NewTripView()
          .environmentObject(UserViewModel(loadTestData: true))
    }
}
