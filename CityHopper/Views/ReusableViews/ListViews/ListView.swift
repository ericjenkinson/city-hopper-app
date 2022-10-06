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
    
      List(cities.indices, id: \.self) { i in
        ZStack {
          NavigationLink (
            destination: DetailView(city: cities[i]),
            label: {     // embedded Navigation link in ZStack
                         // and moved the label element outside
          })             // the Navigation link.
          .opacity(0)    // set opacity of the navigation like to hid disclosue
          LargeListViewElement(city: cities[i])
        }
      }
  }
}

struct ListView_Previews: PreviewProvider {
  static private var cities = [City(name: "Munich", image: "imageMunich", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00), City(name: "Los Angeles", image: "imageLosAngeles", country: "United States", description: "Hollywood1", reviews: [Review(id: UUID(), cityId: UUID(), appUserId: UUID(), rating: 5.0, description: "Wonderful!")], price: 2000.00)]
  
  static var previews: some View {
    ListView(cities: cities)
  }
}
