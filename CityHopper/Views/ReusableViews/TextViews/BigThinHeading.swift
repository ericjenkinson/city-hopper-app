//
//  BigThinHeading.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/1/22.
//

import SwiftUI

struct BigThinHeading: View {
  let text: String
  var body: some View {
    Text(text)
      .fontWeight(.thin)
      .foregroundColor(Constants.Colors.textColor)
      .font(.largeTitle)
      .multilineTextAlignment(.leading)
  }
}

struct BigThinHeading_Previews: PreviewProvider {
    static var previews: some View {
      BigThinHeading(text: Constants.AppData.userName)
    }
}
