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
        LikeButton()
    }
    .padding()

  }
}
struct CoreDataListElementViewHeader_Previews: PreviewProvider {
    static var previews: some View {
      ListElementViewHeader(score: 8.94)
    }
}

struct LikeButton: View {
  @State private var isPressed = false
  @State var liked = false // need to change to binding
  var body: some View {
    Button(action: {
      liked.toggle()
    }, label: {
      RoundedImageView(systemName: Constants.SFSymbols.heart,
                       textColor: liked ? Color.red : Constants.Colors.listViewElementTextColor)
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
