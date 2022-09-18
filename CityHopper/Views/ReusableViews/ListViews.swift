//
//  ListViews.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/18/22.
//

import SwiftUI

struct ListView: View {
  @EnvironmentObject var destinations: Destination
  
  var body: some View {
    
    NavigationView {
      List(destinations.cities.indices, id: \.self) { i in
        NavigationLink (
          destination: DetailView(city: $destinations.cities[i]),
          label: {
            LargeListViewElement(city: $destinations.cities[i])
          })
      }
      .navigationTitle("")
      .navigationBarHidden(true)
    }
    
  }
}
struct ListView_Previews: PreviewProvider {
  static var previews: some View {
    ListView()
      .environmentObject(Destination(loadTestData: true))
  }
}
