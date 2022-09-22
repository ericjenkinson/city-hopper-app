//
//  ListViews.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/18/22.
//

import SwiftUI

struct ListView: View {
  @EnvironmentObject var destinations: CityViewModel
  
  var body: some View {
    
      List(destinations.cities.indices, id: \.self) { i in
        ZStack {
          NavigationLink (
            destination: DetailView(city: $destinations.cities[i]),
            label: {     // embedded Navigation link in ZStack
                         // and moved the label element outside
          })             // the Navigation link.
          .opacity(0)    // set opacity of the navigation like to hid disclosue
          LargeListViewElement(city: $destinations.cities[i])
        }
      }
      
    
    
  }
}
struct ListView_Previews: PreviewProvider {
  static var previews: some View {
    ListView()
      .environmentObject(CityViewModel(loadTestData: true))
  }
}
