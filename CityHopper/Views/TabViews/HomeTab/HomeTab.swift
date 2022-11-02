//
//  HomeScreenTab.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/17/22.
//

import SwiftUI

struct HomeTab: View {
  @State private var onboardingIsVisible = false
  @State private var showPopOver = false
  @EnvironmentObject var networkMonitor: NetworkMonitor

  var body: some View {
    if networkMonitor.isConnected {
      NavigationView {
        VStack {
          HomeTabHeader(onboardingIsVisible: $onboardingIsVisible)
          Divider()
          Spacer()
          CategoryButtonList()
          HorizontalListView()
        }
        .navigationBarHidden(true)
      }
    } else {
      NoNetworkView()
    }
  }
}

struct HomeScreenTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}
