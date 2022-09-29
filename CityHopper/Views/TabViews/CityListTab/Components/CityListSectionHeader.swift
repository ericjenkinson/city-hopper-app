//
//  CityListSectionHeader.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/29/22.
//

import SwiftUI

struct CityListSectionHeader: View {
  let headerText: String
  var body: some View {
    HStack {
      Text(headerText)
        .font(.title2)
        .fontWeight(.bold)
        .padding(.leading)
        .padding(.vertical, 8)
      Spacer()
    }
    .background(
      UIBlurEffect.View(blurStyle: .systemThinMaterial)
    )
    .frame(maxWidth: .infinity)
  }
}

struct CityListSectionHeader_Previews: PreviewProvider {
  static private var headerText = "Header Text"
    static var previews: some View {
        CityListSectionHeader(headerText: headerText)
    }
}
