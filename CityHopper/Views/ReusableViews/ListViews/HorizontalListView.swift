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
        HStack(spacing: -20) {
          ForEach(cities.indices, id: \.self) { i in
            NavigationLink (
              destination: DetailView(city: cities[i]),
              label: {
                LargeListViewElement(city: cities[i])
                  .frame(width: proxy.size.width,
                         height: proxy.size.height)
            })
          }
          
        }
      }
    }
  }
}

struct HorizontalListView_Previews: PreviewProvider {
  static private var cities = [City(name: "Munich", image: "imageMunich", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00), City(name: "Cairo", image: "imageCairo", country: "Egypt", description: "Pyramids!!", reviews: [Review(id: UUID(), cityId: UUID(), appUserId: UUID(), rating: 4.3, description: "Great!")], price: 1600.00), City(name: "Los Angeles", image: "imageLosAngeles", country: "United States", description: "Hollywood!", reviews: [Review(id: UUID(), cityId: UUID(), appUserId: UUID(), rating: 5.0, description: "Wonderful!")], price: 2000.00),
    City(name: "Santorini", image: "imageSantorini", country: "Greece", description: "Blue", reviews: nil, price: 900.00)]
  
    static var previews: some View {
        HorizontalListView(cities: cities)
    }
}
