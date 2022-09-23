//
//  CityListTab.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/17/22.
//

import SwiftUI

struct CityListTab: View {
  let cities: [City]
  let countries: [String]
  
  var body: some View {
    ScrollView(.vertical) {
      LazyVGrid(
        columns: .init(repeating: .init(), count: 2),
        pinnedViews: [.sectionHeaders]
      ){
        ForEach(countries, id: \.self) { country in
          
          Section(header: SectionHeader(headerText: country)) {
            ForEach(cities) { city in
              if city.country == country {
                SmallListViewElement(city: city)
              }
            }
          }
        }
      }
    }
  }
}

struct SectionHeader: View {
  let headerText: String
  var body: some View {
    HStack {
      Text(headerText)
        .font(.title2)
        .fontWeight(.bold)
        .padding(.leading)
        .padding(.vertical, 8)
      Spacer()
    }
    .background(
      UIBlurEffect.View(blurStyle: .systemThinMaterial)
    )
    .frame(maxWidth: .infinity)
  }
}

struct CityListTab_Previews: PreviewProvider {
  static private var cities = [City(name: "Munich", image: "imageMunich", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00), City(name: "Los Angeles", image: "imageLosAngeles", country: "United States", description: "Hollywood1", reviews: [Review(id: UUID(), cityId: UUID(), appUserId: UUID(), rating: 5.0, description: "Wonderful!")], price: 2000.00)]
  static private var countries = ["Germany", "United States"]
  
  static var previews: some View {
    CityListTab(cities: cities, countries: countries)
  }
}
