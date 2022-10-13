//
//  SplashScreen.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/8/22.
//

import SwiftUI

struct LaunchScreen: View {
  
  var body: some View {
    GeometryReader { geo in
      ZStack {
        
        RotatingGlobe()
          .offset(y: 500)
        
        VStack {
          AnimatedAppName()
          ProgressView("Loading city data...", value: 50, total: 100)
        }
        .offset(y: -250)
        .frame(maxWidth: geo.size.width)
        
      }
      .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
    }
  }
}


struct SplashScreen_Previews: PreviewProvider {
  static var previews: some View {
    LaunchScreen()
  }
}
