//
//  ButtonText.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/1/22.
//

import SwiftUI

struct ButtonText: View {
  var text: String

  var body: some View {
    Text(text)
      .foregroundColor(Constants.Colors.buttonTextColor)
      .font(.headline)
      .bold()
      .padding()
      .frame(maxWidth: Constants.General.onboardingCloseButtonMaxWidth)
      .background(
        Color.accentColor
      )
      .cornerRadius(Constants.General.onboardingCloseButtonCornerRadius)
  }
}

struct ButtonText_Previews: PreviewProvider {
    static var previews: some View {
      ButtonText(text: Constants.AppData.closeOnboarding)
    }
}
