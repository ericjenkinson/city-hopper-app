//
//  ListViews.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/10/22.
//

import SwiftUI

struct LargeListViewElement: View {
  var city: City
  
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
        RoundedImageView(systemName: Constants.SFSymbols.filledStar, textColor: Constants.Colors.starSymbolColor)
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
      RoundedImageView(systemName: Constants.SFSymbols.heart, textColor: Constants.Colors.listViewElementTextColor)
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
  static private var city = City(name: "Munich", image: "imageMunich", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00)
  
  static var previews: some View {
    VStack {
      LargeListViewElement(city: city)
      Spacer()
      SmallListViewElement(city: city)
    }
  }
}
