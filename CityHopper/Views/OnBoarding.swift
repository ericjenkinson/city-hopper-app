//
//  OnBoarding.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

struct OnBoarding: View {
  @Binding var onboardingIsVisible: Bool
  
  var body: some View {
    VStack {
      Text(Constants.AppData.appName)
      Button("Dismiss Modal") {
        withAnimation {
          self.onboardingIsVisible.toggle()
        }
      }
    }
  }
}

struct OnBoarding_Previews: PreviewProvider {
  static private var onboardingIsVisible = Binding.constant(false)
  static var previews: some View {
    OnBoarding(onboardingIsVisible: onboardingIsVisible)
  }
}
