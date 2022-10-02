//
//  HomeScreenTab.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/17/22.
//

import SwiftUI

struct HomeTab: View {
  @State private var onboardingIsVisible = false
  @EnvironmentObject var destinations: CityViewModel
  
  var body: some View {
    
    NavigationView {
      VStack {
        HomeTabHeader(onboardingIsVisible: $onboardingIsVisible)
        Divider()
        Spacer()
        //ListView(cities: destinations.cities)
        HorizontalListView(cities: destinations.cities)
      }
      .navigationBarHidden(true)
    }
  }
}





struct HomeScreenTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
          .environmentObject(CityViewModel(loadTestData: true))
    }
}
