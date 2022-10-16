//
//  ListViews.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/18/22.
//

import SwiftUI

// A basic List view using a List
struct ListView: View {
  var cities: [City]

  var body: some View {
      List(cities.indices, id: \.self) { index in
        ZStack {
          NavigationLink(
            destination: DetailView(city: cities[index]),
            label: {     // embedded Navigation link in ZStack
                         // and moved the label element outside
          })             // the Navigation link.
          .opacity(0)    // set opacity of the navigation like to hid disclosue
          LargeListViewElement(city: cities[index])
        }
      }
  }
}

struct ListView_Previews: PreviewProvider {
  static private var cities = [City(name: "Munich", image: "imageMunich", country: "Germany",
                                    description: "Octoberfest!!", price: 1200.00),
                               City(name: "Los Angeles", image: "imageLosAngeles", country: "United States",
                                    description: "Hollywood1", price: 2000.00)]

  static var previews: some View {
    ListView(cities: cities)
  }
}
