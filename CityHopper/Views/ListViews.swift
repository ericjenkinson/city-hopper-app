//
//  ListViews.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/10/22.
//

import SwiftUI

struct ListViewElement: View {
  @Binding var city: City
  
  var body: some View {
    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
      Image(city.image)
        .resizable()
      VStack {
        ListElementViewHeader()
        Spacer()
        ListElementViewFooter(city: city.name, country: city.country)
      }
    }
    .scaledToFit()
    .cornerRadius(Constants.General.listViewElementCornerRadius)
    .padding()
  }
}

struct ListElementViewHeader: View {
  var body: some View {
    HStack {
      HStack {
        RoundedImageView(systemName: "star.fill", textColor: Constants.Colors.starSymbolColor)
        Text("4.5")
          .foregroundColor(Constants.Colors.listViewElementTextColor)
          .bold()
          .padding(.trailing)
      }
      .background(
        UIBlurEffect.View(blurStyle: .regular)
      )
      .cornerRadius(Constants.General.listViewElementCornerRadius)
      
      Spacer()
      RoundedImageView(systemName: "heart", textColor: Constants.Colors.listViewElementTextColor)
        .background(
          UIBlurEffect.View(blurStyle: .regular)
        )
        .cornerRadius(Constants.General.listViewElementCornerRadius)
    }
    .padding()
    
  }
}

struct ListElementViewFooter: View {
  let city: String
  let country: String
  
  var body: some View {
    HStack {
      RoundedImageView(systemName: "location", textColor: Constants.Colors.listViewElementTextColor)
      HStack {
        Text("\(city), ")
          .foregroundColor(Constants.Colors.listViewElementTextColor)
          .bold()
        Text(country).foregroundColor(Constants.Colors.listViewElementTextColor)
          .padding(.trailing)
      }
    }
    .background(
      UIBlurEffect.View(blurStyle: .regular)
    )
    .cornerRadius(Constants.General.listViewElementCornerRadius)
    .padding()
  }
  
}

struct ListViews_Previews: PreviewProvider {
  static private var city = Binding.constant(City(name: "Munich", image: "imageMunich", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00))

  static var previews: some View {
    VStack {
      ListViewElement(city: city)
    }
  }
}
