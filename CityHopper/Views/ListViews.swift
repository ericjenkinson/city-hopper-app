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
    .cornerRadius(50.0)
    .padding()
  }
}

struct ListElementViewHeader: View {
  
  var body: some View {
    HStack {
      HStack {
        RoundedImageView(systemName: "star")
        Text("4.5")
          .padding(.trailing)
      }
      .background(
        UIBlurEffect.View(blurStyle: .regular)
      )
      .cornerRadius(50.0)
      
      Spacer()
      RoundedImageView(systemName: "heart")
        .background(
          UIBlurEffect.View(blurStyle: .regular)
        )
        .cornerRadius(50.0)
    }
    .padding()
    
  }
}

struct ListElementViewFooter: View {
  let city: String
  let country: String
  
  var body: some View {
    HStack {
      RoundedImageView(systemName: "location")
      HStack {
        Text("\(city), ")
        Text(country)
          .padding(.trailing)
      }
    }
    .background(
      UIBlurEffect.View(blurStyle: .regular)
    )
    .cornerRadius(50.0)
    .padding()
  }
  
}

struct ListViews: View {
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

struct ListViews_Previews: PreviewProvider {
  static private var city = Binding.constant(City(name: "Munich", image: "imageMunich", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00))

  static var previews: some View {
    VStack {
      ListViews()
      ListViewElement(city: city)
    }
  }
}
