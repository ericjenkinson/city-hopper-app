//
//  ListElementViewFooter.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 11/1/22.
//

import SwiftUI

struct ListElementViewFooter: View {
  let city: String
  let country: String

  var body: some View {
    HStack {
      RoundedImageView(systemName: Constants.SFSymbols.location, textColor: Constants.Colors.listViewElementTextColor)
      HStack {
        Text("\(city), ")
          .foregroundColor(Constants.Colors.listViewElementTextColor)
          .bold()
        if !country.isEmpty {
          Text(country).foregroundColor(Constants.Colors.listViewElementTextColor)
            .padding(.trailing)
        }
      }
    }
    .background(
      UIBlurEffect.View(blurStyle: .regular)
    )
    .cornerRadius(Constants.General.listViewElementCornerRadius)
    .padding()
  }
}

//struct ListElementViewFooter_Previews: PreviewProvider {
//  static var previews: some View {
//    ListElementViewFooter()
//  }
//}
