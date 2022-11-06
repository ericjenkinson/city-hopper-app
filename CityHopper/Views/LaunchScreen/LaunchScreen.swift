//
//  SplashScreen.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/8/22.
//

import SwiftUI

struct LaunchScreen: View {
  private var dataRetriever = DataRetriever()
  @EnvironmentObject var locationsVM: LocationViewModel

  var body: some View {
    GeometryReader { geo in
      ZStack {

        RotatingGlobe()
          .offset(y: 500)

        VStack {
          AnimatedAppName()
          ProgressView("Loading Location data...")
            .progressViewStyle(.circular)
            .tint(.blue)
        }
        .offset(y: -250)
        .frame(maxWidth: geo.size.width)

      }
      .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
      .onAppear {
        locationsVM.fetchLocations()
      }
    }
  }
}

struct SplashScreen_Previews: PreviewProvider {
  static var previews: some View {
    LaunchScreen()
  }
}
