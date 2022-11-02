//
//  ListViews.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/18/22.
//

import SwiftUI

// A basic List view using a List
struct ListView: View {
  var locations: [Location]

  var body: some View {
      List(locations.indices, id: \.self) { index in
        ZStack {
          NavigationLink(
            destination: DetailView(location: locations[index]),
            label: {     // embedded Navigation link in ZStack
                         // and moved the label element outside
          })             // the Navigation link.
          .opacity(0)    // set opacity of the navigation like to hid disclosue
          LargeListViewElement(location: locations[index])
        }
      }
  }
}
