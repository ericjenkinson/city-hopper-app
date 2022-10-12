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
      OnboardingHeader()
      Spacer()
      OnboardingBody()
      Spacer()
      OnboardingFooter(onboardingIsVisible: $onboardingIsVisible)
    }
  }
}

struct OnboardingHeader:View {
  var body: some View {
    BigBoldHeading(text: Constants.AppData.appName)
      .padding(.top)
  }
}

struct OnboardingBody: View {
  var body: some View {
    VStack(alignment: .leading) {
      UnorderedListLabelText(sfSymbol: Constants.SFSymbols.walking, text: Constants.AppData.obBodyLine1)
      UnorderedListLabelText(sfSymbol:  Constants.SFSymbols.airplane, text: Constants.AppData.obBodyLine2)
      UnorderedListLabelText(sfSymbol: Constants.SFSymbols.group, text: Constants.AppData.obBodyLine3)
      UnorderedListLabelText(sfSymbol: Constants.SFSymbols.camera, text: Constants.AppData.obBodyLine4)
    }
  }
}

struct OnboardingFooter: View {
  @Binding var onboardingIsVisible: Bool
  @State private var isPressed = false
  
  var body: some View {
    Button(action: {
      withAnimation {
        self.onboardingIsVisible.toggle()
      }
    }, label:  {
      ButtonText(text: Constants.AppData.closeOnboarding)
        .padding(.bottom)
    })
    .scaleEffect(isPressed ? 1.05 : 1.0)
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


struct OnBoarding_Previews: PreviewProvider {
  static private var onboardingIsVisible = Binding.constant(false)
  static var previews: some View {
    OnBoarding(onboardingIsVisible: onboardingIsVisible)
    OnBoarding(onboardingIsVisible: onboardingIsVisible)
      .previewLayout(.fixed(width: Constants.General.samplePortraitViewWidth, height: Constants.General.samplePortraitViewHeight))
    OnBoarding(onboardingIsVisible: onboardingIsVisible)
      .preferredColorScheme(.dark)
    OnBoarding(onboardingIsVisible: onboardingIsVisible)
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: Constants.General.samplePortraitViewWidth, height: Constants.General.samplePortraitViewHeight))
  }
}
