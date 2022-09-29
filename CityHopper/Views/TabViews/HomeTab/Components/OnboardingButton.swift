//
//  OnboardingButton.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/29/22.
//

import SwiftUI

struct OnboardingButton: View {
  @Binding var onboardingIsVisible: Bool
  var body: some View {
    Button(action: {
      withAnimation {
        onboardingIsVisible.toggle()
      }
    }) {
      RoundedImageViewStroked(systemName: Constants.AppData.buttonSFSymbol)
    }
    .sheet(isPresented: $onboardingIsVisible) {
      OnBoarding(onboardingIsVisible: $onboardingIsVisible)
    }
  }
}
struct OnboardingButton_Previews: PreviewProvider {
  static private var onboardingIsVisible = Binding.constant(false)
    static var previews: some View {
        OnboardingButton(onboardingIsVisible: onboardingIsVisible)
    }
}
