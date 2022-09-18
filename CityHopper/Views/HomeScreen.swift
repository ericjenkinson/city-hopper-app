//
//  HomeScreen.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

struct HomeScreen: View {
  @EnvironmentObject var destinations: Destination

  enum Tabs {
    case tab1, tab2, tab3, tab4
  }
  
  var body: some View {
      TabView {
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
        
      }
  }
}




struct HomeScreen_Previews: PreviewProvider {
  static var previews: some View {
    HomeScreen()
      .environmentObject(Destination(loadTestData: true))
    HomeScreen()
      .environmentObject(Destination(loadTestData: true))
      .previewLayout(.fixed(width: Constants.General.samplePortraitViewWidth, height: Constants.General.samplePortraitViewHeight))
    HomeScreen()
      .environmentObject(Destination(loadTestData: true))
      .preferredColorScheme(.dark)
    HomeScreen()
      .environmentObject(Destination(loadTestData: true))
      .previewLayout(.fixed(width: Constants.General.samplePortraitViewWidth, height: Constants.General.samplePortraitViewHeight))
      .preferredColorScheme(.dark)
  }
}
