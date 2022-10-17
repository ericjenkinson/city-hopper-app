//
//  LikesListTab.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/23/22.
//

import SwiftUI

struct LikesListTab: View {
  let likedCitiesFetchRequest = LikedCities.citiesLiked()
  var likedCities: FetchedResults<LikedCities> {
    likedCitiesFetchRequest.wrappedValue
  }

  var body: some View {
    NavigationView {
      VStack {
        List {
          Section {
            ForEach(likedCities, id: \.self) { city in
              Text(city.locations?.name ?? "")
            }
          }
        }
      }
    }
  }
}
