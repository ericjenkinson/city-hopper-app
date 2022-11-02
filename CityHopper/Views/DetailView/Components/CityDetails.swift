//
//  CityDetails.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/29/22.
//

import SwiftUI

struct CityDetails: View {
  @Binding var showingThingsToDo: Bool
  var location: Location
  var body: some View {
    VStack(spacing: 0.0) {
      HStack {
        Text(location.name ?? "Name Missing")
          .foregroundColor(Constants.Colors.listViewElementTextColor)
        Spacer()
        Text(String(location.price))
          .foregroundColor(Constants.Colors.listViewElementTextColor)
      }
      HStack {
        HStack {
          RoundedImageView(systemName: "location", textColor: Constants.Colors.listViewElementTextColor)
            .padding(-10)
          Text(location.country ?? "Country missing")
            .foregroundColor(Constants.Colors.listViewElementTextColor)
            .padding(-10)
        }

        Spacer()
        Text("/ per person")
          .foregroundColor(Constants.Colors.listViewElementTextColor)

      }
    }
    .padding()
    .background(
      UIBlurEffect.View(blurStyle: .regular)
    )
    .cornerRadius(Constants.General.detailViewCityDetailsCornerRadius)
  }
}
