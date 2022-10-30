//
//  CoreDataListElementViewHeader.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/16/22.
//

import SwiftUI

struct ListElementViewHeader: View {
  var score: Double
  var body: some View {
    HStack {
      HStack {
        RoundedImageView(systemName: Constants.SFSymbols.filledStar, textColor: Constants.Colors.starSymbolColor)
        Text(String(score.rounded(toPlaces: 2)))
          .foregroundColor(Constants.Colors.listViewElementTextColor)
          .bold()
          .padding(.trailing)
      }
      .background(
        UIBlurEffect.View(blurStyle: .regular)
      )
      .cornerRadius(Constants.General.listViewElementCornerRadius)
      Spacer()
      RoundedImageView(systemName: Constants.SFSymbols.heart, textColor: Constants.Colors.listViewElementTextColor)
        .background(
          UIBlurEffect.View(blurStyle: .regular)
        )
        .cornerRadius(Constants.General.listViewElementCornerRadius)
    }
    .padding()

  }
}
struct CoreDataListElementViewHeader_Previews: PreviewProvider {
    static var previews: some View {
      ListElementViewHeader(score: 8.94)
    }
}
