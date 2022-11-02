//
//  OnboardingButton.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/29/22.
//

import SwiftUI

struct OnboardingButton: View {
  @Binding var onboardingIsVisible: Bool
  @State private var isPressed = false
  var body: some View {
    Button(action: {
      withAnimation {
        onboardingIsVisible.toggle()
      }
    }, label: {
      RoundedImageViewStroked(systemName: Constants.SFSymbols.info)
    })
    .sheet(isPresented: $onboardingIsVisible) {
      OnBoarding(onboardingIsVisible: $onboardingIsVisible)
    }
    .scaleEffect(isPressed ? 1.4 : 1.0)
    .opacity(isPressed ? 0.6 : 1.0)
    .pressEvents(onPress: {
      withAnimation(.easeInOut(duration: 0.1)) {
        isPressed = true
      }
    }, onRelease: {
      withAnimation {
        isPressed = false
      }
    })
  }
}
struct OnboardingButton_Previews: PreviewProvider {
  static private var onboardingIsVisible = Binding.constant(false)
    static var previews: some View {
        OnboardingButton(onboardingIsVisible: onboardingIsVisible)
    }
}
