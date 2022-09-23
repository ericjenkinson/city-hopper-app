//
//  HomeScreen.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

struct HomeScreen: View {
  @EnvironmentObject var destinations: CityViewModel
  
  
  enum Tabs {
    case tab1, tab2, tab3, tab4, tab5
  }
  
  @State var defaultTab = Tabs.tab1
  
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
          .badge(destinations.cities.count)
          .tag(Tabs.tab2)
        LikesListTab()
          .tabItem {
            Image(systemName: Constants.SFSymbols.heartFill)
            Text("Likes")
          }
        .tag(Tabs.tab3)
        TripListTab()
          .tabItem {
            Image(systemName: Constants.SFSymbols.tripList)
            Text("Trips")
          }
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




struct HomeScreen_Previews: PreviewProvider {
  static var previews: some View {
    HomeScreen()
      .environmentObject(CityViewModel(loadTestData: true))
    HomeScreen()
      .environmentObject(CityViewModel(loadTestData: true))
      .previewLayout(.fixed(width: Constants.General.samplePortraitViewWidth, height: Constants.General.samplePortraitViewHeight))
    HomeScreen()
      .environmentObject(CityViewModel(loadTestData: true))
      .preferredColorScheme(.dark)
    HomeScreen()
      .environmentObject(CityViewModel(loadTestData: true))
      .previewLayout(.fixed(width: Constants.General.samplePortraitViewWidth, height: Constants.General.samplePortraitViewHeight))
      .preferredColorScheme(.dark)
  }
}
