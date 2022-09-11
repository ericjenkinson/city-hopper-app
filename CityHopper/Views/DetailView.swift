//
//  DetailView.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/10/22.
//

import SwiftUI

struct DetailView: View {
  @Binding var city: City
  
  var body: some View {
    ZStack {
      Image(city.image)
        .resizable()
        .scaledToFit()
        .ignoresSafeArea()
      
      VStack {
        Spacer()
        CityDetails(city: city)
          .padding()
      }
    }
    .navigationTitle("")
  }
}

struct CityDetails: View {
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
        RoundedImageView(systemName: "location", textColor: Constants.Colors.listViewElementTextColor)
        Text(city.country)
          .foregroundColor(Constants.Colors.listViewElementTextColor)
        Spacer()
        Text("/ per person")
          .foregroundColor(Constants.Colors.listViewElementTextColor)
        
      }
      HStack {
        Text(city.description)
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

struct DetailView_Previews: PreviewProvider {
  static private var city = Binding.constant(City(name: "Munich", image: "imageMunich", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00))
  
  static var previews: some View {
    DetailView(city: city)
    DetailView(city: city)
      .preferredColorScheme(.dark)
  }
}
