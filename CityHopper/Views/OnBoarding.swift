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
      obHeader()
      Spacer()
      obFooter(onboardingIsVisible: $onboardingIsVisible)
    }
  }
}

struct obHeader:View {
  var body: some View {
    BigBoldHeading(text: Constants.AppData.appName)
      .padding(.top)
  }
}

struct obFooter: View {
  @Binding var onboardingIsVisible: Bool
  var body: some View {
    Button(action: {
      withAnimation {
        self.onboardingIsVisible.toggle()
      }
    }) {
      ButtonText(text: Constants.AppData.closeOnboarding)
        .padding(.bottom)
    }
  }
}


struct OnBoarding_Previews: PreviewProvider {
  static private var onboardingIsVisible = Binding.constant(false)
  static var previews: some View {
    OnBoarding(onboardingIsVisible: onboardingIsVisible)
    OnBoarding(onboardingIsVisible: onboardingIsVisible)
      .preferredColorScheme(.dark)
  }
}
