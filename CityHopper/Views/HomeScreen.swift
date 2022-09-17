//
//  HomeScreen.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

struct HomeScreen: View {
  @State private var onboardingIsVisible = false
  @EnvironmentObject var destinations: Destination

  var body: some View {
    
    NavigationView {
      VStack {
        HomeScreenHeader(onboardingIsVisible: $onboardingIsVisible)
        Divider()
        Spacer()
        DestinationsView()
      }
      .navigationTitle("")
      .navigationBarHidden(true)
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
  }
}

struct HomeScreenHeader: View {
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

struct DestinationsView: View {
  @EnvironmentObject var destinations: Destination
  
  var body: some View {
    ScrollView {
      LazyVStack {
        ForEach(destinations.cities.indices, id: \.self) { i in
          NavigationLink (
            destination: DetailView(city: $destinations.cities[i]),
            label: {
                ListViewElement(city: $destinations.cities[i])
            })
        }
      }
    }
    
  }
}


struct HomeScreen_Previews: PreviewProvider {
  static var previews: some View {
    HomeScreen()
      .environmentObject(Destination(loadTestData: true))
    HomeScreen()
      .environmentObject(Destination(loadTestData: true))
      .previewLayout(.fixed(width: Constants.General.samplePortraitViewWidth, height: Constants.General.samplePortraitViewHeight))
    HomeScreen()
      .environmentObject(Destination(loadTestData: true))
      .preferredColorScheme(.dark)
    HomeScreen()
      .environmentObject(Destination(loadTestData: true))
      .previewLayout(.fixed(width: Constants.General.samplePortraitViewWidth, height: Constants.General.samplePortraitViewHeight))
      .preferredColorScheme(.dark)
  }
}
