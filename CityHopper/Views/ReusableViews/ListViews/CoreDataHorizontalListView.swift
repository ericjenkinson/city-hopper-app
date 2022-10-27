//
//  HorizontalListView.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/30/22.
//

import SwiftUI

struct CoreDataHorizontalListView: View {
  @EnvironmentObject var locationsVM: LocationViewModel
  //var cities: [City]
  var body: some View {
    GeometryReader { proxy in
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: -20) {
          ForEach(locationsVM.locations.indices, id: \.self) { index in
            NavigationLink(
              destination: CoreDataDetailView(location: locationsVM.locations[index]),
              label: {
                CoreDataLargeListViewElement(location: locationsVM.locations[index])
                  .frame(width: proxy.size.width,
                         height: proxy.size.height)
            })
          }
        }
      }
    }
  }
}


//struct CoreDataHorizontalListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoreDataHorizontalListView()
//    }
//}
