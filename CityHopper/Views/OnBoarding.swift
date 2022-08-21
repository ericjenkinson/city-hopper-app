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
      obBody()
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

struct obBody: View {
  var body: some View {
    VStack(alignment: .leading) {
      UnorderedListLabelText(sfSymbol: Constants.SFSymbols.walking, text: Constants.AppData.obBodyLine1)
      UnorderedListLabelText(sfSymbol:  Constants.SFSymbols.airplane, text: Constants.AppData.obBodyLine2)
      UnorderedListLabelText(sfSymbol: Constants.SFSymbols.group, text: Constants.AppData.obBodyLine3)
      UnorderedListLabelText(sfSymbol: Constants.SFSymbols.camera, text: Constants.AppData.obBodyLine4)
    }
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
      .previewLayout(.fixed(width: Constants.General.samplePortraitViewWidth, height: Constants.General.samplePortraitViewHeight))
    OnBoarding(onboardingIsVisible: onboardingIsVisible)
      .preferredColorScheme(.dark)
    OnBoarding(onboardingIsVisible: onboardingIsVisible)
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: Constants.General.samplePortraitViewWidth, height: Constants.General.samplePortraitViewHeight))
  }
}
