//
//  RoundedImageViewStroked.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/1/22.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String
  var textColor = Constants.Colors.textColor
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(textColor)
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .overlay(
        Circle()
          .strokeBorder(Constants.Colors.buttonStrokeColor, lineWidth: Constants.General.strokeWidth)
      )
  }
}

struct RoundedImageViewStroked_Previews: PreviewProvider {
    static var previews: some View {
      RoundedImageViewStroked(systemName: Constants.SFSymbols.info)
    }
}
