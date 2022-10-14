//
//  HomeScreen.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

struct HomeScreen: View {

  private var dataRetriever = DataRetriever()

  @State var showLaunchScreen = true

  var body: some View {
    ZStack {
      HomeTabView()
        .opacity(showLaunchScreen ? 0 : 1)

      LaunchScreen()
        .opacity(showLaunchScreen ? 1 : 0)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
              withAnimation(.easeOut(duration: 2)) {
                showLaunchScreen = false
              }
            }
          }
      }
  }
}

struct HomeScreen_Previews: PreviewProvider {
  static var previews: some View {
    HomeScreen()
  }
}
