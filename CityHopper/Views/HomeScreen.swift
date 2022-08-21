//
//  HomeScreen.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

struct HomeScreen: View {
  @State private var onboardingIsVisible = false
  
  var body: some View {
    VStack {
      HStack {
        VStack(alignment: .leading) {
          BigBoldHeading(text: Constants.AppData.welcomeMessage)
            .padding(.leading)
          BigThinHeading(text: Constants.AppData.userName)
            .padding(.leading)
        }
        Spacer()
        OnboardingButton(onboardingIsVisible: $onboardingIsVisible)
          .padding([.bottom, .trailing])
      }
      .padding(.top)
    Spacer()
    }
  }
}


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
    //.fullScreenCover(isPresented: $onboardingIsVisible, content: OnBoarding.init)
  }
}

struct HomeScreen_Previews: PreviewProvider {
  static var previews: some View {
    HomeScreen()
    HomeScreen()
      .previewLayout(.fixed(width: 568, height: 320))
    HomeScreen()
      .preferredColorScheme(.dark)
    HomeScreen()
      .previewLayout(.fixed(width: 568, height: 320))
      .preferredColorScheme(.dark)
  }
}
