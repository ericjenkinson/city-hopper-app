//
//  SplashScreen.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/8/22.
//

import SwiftUI

struct SplashScreen: View {
  var body: some View {
    ZStack {
    
      RotatingGlobe()
        .offset(y: 420)
      
    }
  }
}




struct SplashScreen_Previews: PreviewProvider {
  static var previews: some View {
    SplashScreen()
  }
}
