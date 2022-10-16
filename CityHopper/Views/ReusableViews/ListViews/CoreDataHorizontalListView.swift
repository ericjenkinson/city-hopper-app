//
//  HorizontalListView.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/30/22.
//

import SwiftUI

struct CoreDataHorizontalListView: View {

  let locationsFetchRequest = Location.basicFetchRequest()
  var locations: FetchedResults<Location> {
    locationsFetchRequest.wrappedValue
  }

  let sortTypes = [
    (name: "Name", descriptors: [SortDescriptor(\Location.name, order: .forward)]),
    (name: "Score", descriptors: [SortDescriptor(\Location.score, order: .reverse)]),
    (name: "Price", descriptors: [SortDescriptor(\Location.price, order: .reverse)])
  ]
  @State var activeSortIndex = 0

  var body: some View {
    NavigationView {
      GeometryReader { proxy in
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: -20) {
            ForEach(locations, id: \.self) { location in
              NavigationLink(
                destination: CoreDataDetailView(location: location),
                label: {
                  CoreDataLargeListViewElement(location: location)
                    .frame(width: proxy.size.width,
                           height: proxy.size.height)
              })
            }
          }
          // .navigationBarHidden(true)
          .onChange(of: activeSortIndex) { _ in
            locations.sortDescriptors = sortTypes[activeSortIndex].descriptors
          }
          .toolbar {
            Menu(content: {
              Picker(selection: $activeSortIndex, content: {
                ForEach(0..<sortTypes.count, id: \.self) { index in
                  let sortType = sortTypes[index]
                  Text(sortType.name)
                }
              }, label: {}
              )
            }, label: {
              Image(systemName: "line.3.horizontal.decrease.circle.fill")
            })
          }
        }
      }
    }
  }
}

struct CoreDataHorizontalListView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataHorizontalListView()
    }
}
