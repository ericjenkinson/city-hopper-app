//
//  RotatingGlobe.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/8/22.
//

import SwiftUI

struct RotatingGlobe: View {
  @State private var isRotating = false

  var animation: Animation {
    Animation.linear
      .speed(0.005)
      .repeatForever(autoreverses: false)
  }

  var body: some View {
    ZStack {
      Image("destinationsGlobe")
        .rotationEffect(Angle.degrees(isRotating ? 360 : 0))
        .animation(animation, value: isRotating)
    }
    .onAppear {
      isRotating.toggle()
    }
  }
}

struct RotatingGlobe_Previews: PreviewProvider {
    static var previews: some View {
        RotatingGlobe()
          .offset(y: 420)
    }
}
