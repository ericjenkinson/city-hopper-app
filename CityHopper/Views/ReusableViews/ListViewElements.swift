//
//  ListViews.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/10/22.
//

import SwiftUI

struct ListElementViewFooter: View {
  let city: String
  let country: String

  var body: some View {
    HStack {
      RoundedImageView(systemName: Constants.SFSymbols.location, textColor: Constants.Colors.listViewElementTextColor)
      HStack {
        Text("\(city), ")
          .foregroundColor(Constants.Colors.listViewElementTextColor)
          .bold()
        if !country.isEmpty {
          Text(country).foregroundColor(Constants.Colors.listViewElementTextColor)
            .padding(.trailing)
        }
      }
    }
    .background(
      UIBlurEffect.View(blurStyle: .regular)
    )
    .cornerRadius(Constants.General.listViewElementCornerRadius)
    .padding()
  }
}

struct SmallListViewElement: View {
  var city: City

  var body: some View {
    Image(city.image)
      .resizable()
      .scaledToFill()
      .frame(width: 120, height: 120)
      .cornerRadius(20)
      .overlay(
        Text(city.name)
          .fontWeight(.bold)
          .foregroundColor(Constants.Colors.listViewElementTextColor)
          .padding(10)
          .frame(alignment: .bottomLeading),
        alignment: .bottomLeading
      )
  }
}

struct ListViews_Previews: PreviewProvider {
  static private var city = City(name: "Munich", image: "imageCairo", country: "Germany",
                                 description: "Octoberfest!!", price: 1200.00)

  static var previews: some View {
    VStack {
      Spacer()
      SmallListViewElement(city: city)
    }
  }
}
