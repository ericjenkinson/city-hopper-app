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
      ) {
        ForEach(countries, id: \.self) { country in

          Section(header: CityListSectionHeader(headerText: country)) {
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

struct CityListTab_Previews: PreviewProvider {
  static private var cities = [City(name: "Munich", image: "imageMunich", country: "Germany",
                                    description: "Octoberfest!!", price: 1200.00),
                               City(name: "Los Angeles", image: "imageLosAngeles", country: "United States",
                                    description: "Hollywood1", price: 2000.00)]
  static private var countries = ["Germany", "United States"]

  static var previews: some View {
    CityListTab(cities: cities, countries: countries)
  }
}
