//
//  HomeScreen.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

struct HomeScreen: View {
  
  @State var showSplashScreen = true
  
  var body: some View {
    ZStack {
      if showSplashScreen {
        LaunchScreen()
          .opacity(showSplashScreen ? 1 : 0)
          .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
              withAnimation() {
                showSplashScreen.toggle()
              }
            }
          }
      } else {
        HomeTabView()
      }
    }
  }
}

struct HomeScreen_Previews: PreviewProvider {
  static var previews: some View {
    HomeScreen()
  }
}
