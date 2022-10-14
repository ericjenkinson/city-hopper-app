//
//  CityDetails.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/29/22.
//

import SwiftUI

struct CityDetails: View {
  @Binding var showingThingsToDo: Bool
  var city: City
  var body: some View {
    VStack(spacing: 0.0) {
      HStack {
        Text(city.name)
          .foregroundColor(Constants.Colors.listViewElementTextColor)
        Spacer()
        Text(String(city.price))
          .foregroundColor(Constants.Colors.listViewElementTextColor)
      }
      HStack {
        HStack {
          RoundedImageView(systemName: "location", textColor: Constants.Colors.listViewElementTextColor)
            .padding(-10)
          Text(city.country)
            .foregroundColor(Constants.Colors.listViewElementTextColor)
            .padding(-10)
        }

        Spacer()
        Text("/ per person")
          .foregroundColor(Constants.Colors.listViewElementTextColor)

      }
      HStack {
        Button(action: {
          withAnimation {
            self.showingThingsToDo.toggle()
          }
        }) {
          ButtonText(text: "Things to do!")

        }.sheet(isPresented: $showingThingsToDo) {
          ThingsToDo(thingsToDo: city.thingsToDo)
        }

      }
    }
    .padding()
    .background(
      UIBlurEffect.View(blurStyle: .regular)
    )
    .cornerRadius(Constants.General.detailViewCityDetailsCornerRadius)
  }
}

struct CityDetails_Previews: PreviewProvider {
  static private var showingThingsToDo = Binding.constant(false)
  static private var city = City(name: "Munich", image: "imageMunich", country: "Germany",
                                 description: "Octoberfest!!", reviews: nil, price: 1200.00)

    static var previews: some View {
        CityDetails(showingThingsToDo: showingThingsToDo, city: city)
    }
}
