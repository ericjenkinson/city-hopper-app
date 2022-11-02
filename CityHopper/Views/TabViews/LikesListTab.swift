//
//  LikesListTab.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/23/22.
//

import SwiftUI

struct LikesListTab: View {
  @EnvironmentObject var likedCitiesVM: LikedCitiesViewModel

  var body: some View {
    NavigationView {
      VStack {
        List {
          ForEach(likedCitiesVM.likedCities, id: \.self) { city in
            Text(city.locations.name ?? "")
          }
        }
      }
    }
  }
}
