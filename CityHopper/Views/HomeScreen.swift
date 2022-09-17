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
    NavigationView {
      TabView {
        HomeScreenTab()
          .tabItem {
            Image(systemName: "house.fill")
            Text("Home")
          }
          .tag(Tabs.tab1)
      }
    }
  }
}

struct DestinationsView: View {
  @EnvironmentObject var destinations: Destination
  
  var body: some View {
    ScrollView {
      LazyVStack {
        ForEach(destinations.cities.indices, id: \.self) { i in
          NavigationLink (
            destination: DetailView(city: $destinations.cities[i]),
            label: {
                ListViewElement(city: $destinations.cities[i])
            })
        }
      }
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
