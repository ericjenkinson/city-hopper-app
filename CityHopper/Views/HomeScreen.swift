//
//  HomeScreen.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

struct HomeScreen: View {
  @State private var onboardingIsVisible = false
  @State private var destinations = Destination(loadTestData: true)
  @State private var cart = Cart(loadTestData: true)
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
      ScrollView {
        VStack {
          ForEach(destinations.cities.indices, id: \.self) { i in
            Text(destinations.cities[i].name)
          }
          Text("Total Price (including discounts): \(cart.currentDiscountedAmount)")
        }
      }
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

struct HomeScreen_Previews: PreviewProvider {
  static var previews: some View {
    HomeScreen()
    HomeScreen()
      .previewLayout(.fixed(width: Constants.General.samplePortraitViewWidth, height: Constants.General.samplePortraitViewHeight))
    HomeScreen()
      .preferredColorScheme(.dark)
    HomeScreen()
      .previewLayout(.fixed(width: Constants.General.samplePortraitViewWidth, height: Constants.General.samplePortraitViewHeight))
      .preferredColorScheme(.dark)
  }
}
