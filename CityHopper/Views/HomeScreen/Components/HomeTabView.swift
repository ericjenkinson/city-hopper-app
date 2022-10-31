//
//  HomeTabView.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/9/22.
//

import SwiftUI

struct HomeTabView: View {
  enum Tabs {
    case tab1, tab2, tab3, tab4
  }

  @State var defaultTab = Tabs.tab1
  @EnvironmentObject var tripsVM: TripsViewModel

  var body: some View {
    TabView(selection: $defaultTab) {
      HomeTab()
        .tabItem {
          Image(systemName: Constants.SFSymbols.filledHouse)
          Text(Constants.AppData.tabTextHome)
        }
        .tag(Tabs.tab1)
      LikesListTab()
        .tabItem {
          Image(systemName: Constants.SFSymbols.heartFill)
          Text("Likes")
        }
        .tag(Tabs.tab2)
      TripListTab()
        .tabItem {
          Image(systemName: Constants.SFSymbols.tripList)
          Text("Trips")
        }
        .badge(tripsVM.numberOfTrips())
        .tag(Tabs.tab3)
    }
  }
}

struct HomeTabView_Previews: PreviewProvider {
  static var previews: some View {
    HomeTabView()
  }
}
