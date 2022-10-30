//
//  HomeScreen.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

struct HomeScreen: View {
  // MARK: - Properties

  // MARK: - State Properties
  @State var showLaunchScreen = true

  var body: some View {
    ZStack {
      HomeTabView()
        .opacity(showLaunchScreen ? 0 : 1)

      LaunchScreen()
        .opacity(showLaunchScreen ? 1 : 0)
        .onAppear {
            Task {
              try? await Task.sleep(nanoseconds: 10 * 1_000_000_000)
              await MainActor.run {
                withAnimation(.easeOut(duration: 2)) {
                  showLaunchScreen = false
                }
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
