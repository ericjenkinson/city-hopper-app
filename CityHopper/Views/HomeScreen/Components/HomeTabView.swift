//
//  HomeTabView.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/9/22.
//

import SwiftUI

struct HomeTabView: View {
  enum Tabs {
    case tab1, tab2, tab3, tab4, tab5
  }

  @State var defaultTab = Tabs.tab1
  @EnvironmentObject var destinations: CityViewModel
  @EnvironmentObject var appUser: UserViewModel

  var body: some View {
    TabView(selection: $defaultTab) {
      HomeTab()
        .tabItem {
          Image(systemName: Constants.SFSymbols.filledHouse)
          Text(Constants.AppData.tabTextHome)
        }
        .tag(Tabs.tab1)
      CityListTab(cities: destinations.cities, countries: destinations.getCountries())
        .tabItem {
          Image(systemName: Constants.SFSymbols.location)
          Text(Constants.AppData.tabTextCities)
        }
        .tag(Tabs.tab2)
      LikesListTab()
        .tabItem {
          Image(systemName: Constants.SFSymbols.heartFill)
          Text("Likes")
        }
        .tag(Tabs.tab3)
      TripListTab(trips: $appUser.appUser.trips)
        .tabItem {
          Image(systemName: Constants.SFSymbols.tripList)
          Text("Trips")
        }
        .badge(appUser.numberOfTrips)
        .tag(Tabs.tab4)
      ThingsToDo(thingsToDo: destinations.cities[0].thingsToDo)
        .tabItem {
          Image(systemName: "sun.max")
          Text("Things to Do")
        }
        .tag(Tabs.tab5)
    }

  }
}

struct HomeTabView_Previews: PreviewProvider {
  static var previews: some View {
    HomeTabView()
      .environmentObjectModifiers()
  }
}
