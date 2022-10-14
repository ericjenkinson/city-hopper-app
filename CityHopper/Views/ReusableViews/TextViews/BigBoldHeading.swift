//
//  BigBoldHeading.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/1/22.
//

import SwiftUI

struct BigBoldHeading: View {
  let text: String

  var body: some View {
    Text(text)
      .foregroundColor(Constants.Colors.textColor)
      .font(.largeTitle)
      .bold()
  }
}

struct BigBoldHeading_Previews: PreviewProvider {
    static var previews: some View {
      BigBoldHeading(text: Constants.AppData.welcomeMessage)
    }
}
