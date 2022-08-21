//
//  TextViews.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

struct BigBoldHeading: View {
  let text: String
  
  var body: some View {
    Text(text)
      .foregroundColor(Color(Constants.Color.TextColor))
      .font(.largeTitle)
      .bold()
  }
}

struct BigThinHeading: View {
  let text: String
  var body: some View {
    Text(text)
      .fontWeight(.thin)
      .foregroundColor(Color(Constants.Color.TextColor))
      .font(.largeTitle)
      .multilineTextAlignment(.leading)
  }
}

struct ButtonText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .foregroundColor(Color(Constants.Color.ButtonTextColor))
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

struct TextPreviews: View {
  var body: some View {
    VStack {
      BigBoldHeading(text: Constants.AppData.welcomeMessage)
      BigThinHeading(text: Constants.AppData.userName)
      ButtonText(text: Constants.AppData.closeOnboarding)
    }
  }
}


struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    TextPreviews()
    TextPreviews()
      .previewLayout(.fixed(width: 568, height: 320))
    TextPreviews()
      .preferredColorScheme(.dark)
    TextPreviews()
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 568, height: 320))
  }
}
