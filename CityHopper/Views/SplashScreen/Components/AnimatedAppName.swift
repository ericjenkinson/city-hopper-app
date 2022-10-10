//
//  AnimatedAppName.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/9/22.
//

import SwiftUI

struct AnimatedAppName: View {
  @State private var isTextAnimating = false
  @State private var isPlaneAnimating = false
  
  var textAnimation: Animation {
    Animation.spring()
      .speed(0.1)
  }
  
  var planeAnimation: Animation {
    Animation.linear
      .speed(0.1)
  }
  
  var body: some View {
    ZStack {
      Text("City\nHopper")
        .font(.system(size: 80))
        .scaleEffect(isTextAnimating ? 1 : 0.1)
        .animation(textAnimation, value: isTextAnimating)
      Image("screenShotPlane")
        .offset(x: isPlaneAnimating ? 300 : -300)
        .animation(planeAnimation, value: isPlaneAnimating)
    }
    .onAppear {
      isTextAnimating.toggle()
      isPlaneAnimating.toggle()
    }
  }
}

struct AnimatedAppName_Previews: PreviewProvider {
  static var previews: some View {
    AnimatedAppName()
  }
}
