//
//  HomeScreenTab.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/17/22.
//

import SwiftUI

struct HomeTab: View {
  @State private var onboardingIsVisible = false
  @EnvironmentObject var destinations: DestinationViewModel
  
  var body: some View {
    
    NavigationView {
      VStack {
        HomeTabHeader(onboardingIsVisible: $onboardingIsVisible)
        Divider()
        Spacer()
        ListView()
      }
      .navigationBarHidden(true)
    }
  }
}

struct HomeTabHeader: View {
  @Binding var onboardingIsVisible: Bool
  
  var body: some View {
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
  }
}

struct HomeScreenTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
          .environmentObject(DestinationViewModel(loadTestData: true))
    }
}
