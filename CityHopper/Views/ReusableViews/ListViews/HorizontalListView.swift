//
//  HorizontalListView.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/30/22.
//

import SwiftUI

struct HorizontalListView: View {
  @EnvironmentObject var locationsVM: LocationViewModel

  var body: some View {
    GeometryReader { proxy in
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: -20) {
          ForEach(locationsVM.locations.indices, id: \.self) { index in
            NavigationLink(
              destination: DetailView(location: locationsVM.locations[index]),
              label: {
                LargeListViewElement(location: locationsVM.locations[index])
                  .frame(width: proxy.size.width,
                         height: proxy.size.height)
            })
          }
        }
      }
    }
  }
}
