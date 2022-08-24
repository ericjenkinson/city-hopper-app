//
//  ButtonViews.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color(Constants.Color.TextColor))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .overlay(
        Circle()
          .strokeBorder(Color(Constants.Color.ButtonStrokeColor), lineWidth: Constants.General.strokeWidth)
      )
  }
}

struct RoundedImageView: View {
  var systemName: String
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color(Constants.Color.TextColor))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
  }
}

struct ButtonPreviews: View {
  var body: some View {
    VStack {
      RoundedImageViewStroked(systemName: Constants.AppData.buttonSFSymbol)
      RoundedImageView(systemName: Constants.AppData.buttonSFSymbol)
    }
  }
}

struct ButtonViews_Previews: PreviewProvider {
    static var previews: some View {
      ButtonPreviews()
      ButtonPreviews()
        .preferredColorScheme(.dark)
    }
}
