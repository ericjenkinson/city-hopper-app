//
//  HorizontalListView.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/30/22.
//

import SwiftUI

struct HorizontalListView: View {
  var cities: [City]
  var body: some View {
    GeometryReader { proxy in
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(cities.indices, id: \.self) { i in
            NavigationLink (
              destination: DetailView(city: cities[i]),
              label: {
                LargeListViewElement(city: cities[i])
                  .frame(width: proxy.size.width * 0.9,
                         height: proxy.size.height * 0.9)
            })
          }
          
        }
      }
    }
  }
}

struct HorizontalListView_Previews: PreviewProvider {
  static private var cities = [City(name: "Munich", image: "imageMunich", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00), City(name: "Los Angeles", image: "imageLosAngeles", country: "United States", description: "Hollywood1", reviews: [Review(id: UUID(), cityId: UUID(), appUserId: UUID(), rating: 5.0, description: "Wonderful!")], price: 2000.00)]
  
    static var previews: some View {
        HorizontalListView(cities: cities)
    }
}
