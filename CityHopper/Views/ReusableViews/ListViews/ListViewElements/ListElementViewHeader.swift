//
//  CoreDataListElementViewHeader.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/16/22.
//

import SwiftUI

struct ListElementViewHeader: View {
  var location: Location
  var body: some View {
    HStack {
      HStack {
        RoundedImageView(systemName: Constants.SFSymbols.filledStar, textColor: Constants.Colors.starSymbolColor)
        Text(String(location.score.rounded(toPlaces: 2)))
          .foregroundColor(Constants.Colors.listViewElementTextColor)
          .bold()
          .padding(.trailing)
      }
      .background(
        UIBlurEffect.View(blurStyle: .regular)
      )
      .cornerRadius(Constants.General.listViewElementCornerRadius)
      Spacer()
        LikeButton(location: location)
    }
    .padding()

  }
}

struct LikeButton: View {
  @EnvironmentObject var locationsVM: LocationViewModel
  @State private var isPressed = false
  
  var location: Location
  var body: some View {
    Button(action: {
      location.liked?.isLiked.toggle()
      locationsVM.updateLocations()
    }, label: {
      RoundedImageView(systemName: Constants.SFSymbols.heart,
                       textColor: location.liked!.isLiked ? Color.red : Constants.Colors.listViewElementTextColor)
        .background(
          UIBlurEffect.View(blurStyle: .regular)
        )
        .cornerRadius(Constants.General.listViewElementCornerRadius)

    })
    .scaleEffect(isPressed ? 1.4 : 1.0)
    .opacity(isPressed ? 0.6 : 1.0)
    .pressEvents(onPress: {
      withAnimation(.easeInOut(duration: 0.1)) {
        isPressed = true
      }
    }, onRelease: {
      withAnimation {
        isPressed = false
      }
    })
  }
}
