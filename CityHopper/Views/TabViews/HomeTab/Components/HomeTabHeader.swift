//
//  HomeTabHeader.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/29/22.
//

import SwiftUI

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
struct HomeTabHeader_Previews: PreviewProvider {
  static private var onboardingIsVisible = Binding.constant(false)
    static var previews: some View {
        HomeTabHeader(onboardingIsVisible: onboardingIsVisible)
    }
}
