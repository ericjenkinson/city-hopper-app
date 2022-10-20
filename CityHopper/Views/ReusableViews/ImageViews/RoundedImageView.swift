//
//  ButtonViews.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

struct RoundedImageView: View {
  var systemName: String
  var textColor = Constants.Colors.textColor
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(textColor)
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
  }
}

struct RoundedImageView_Previews: PreviewProvider {
    static var previews: some View {
      RoundedImageView(systemName: Constants.AppData.buttonSFSymbol)
    }
}
