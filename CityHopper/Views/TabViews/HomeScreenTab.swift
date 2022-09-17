//
//  HomeScreenTab.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/17/22.
//

import SwiftUI

struct HomeScreenTab: View {
  @State private var onboardingIsVisible = false
  @EnvironmentObject var destinations: Destination
  
  var body: some View {
    
    VStack {
      HomeScreenTabHeader(onboardingIsVisible: $onboardingIsVisible)
      Divider()
      Spacer()
      DestinationsView()
    }
    .navigationTitle("")
    .navigationBarHidden(true)
    
  }
}

struct HomeScreenTabHeader: View {
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
        HomeScreenTab()
          .environmentObject(Destination(loadTestData: true))
    }
}
