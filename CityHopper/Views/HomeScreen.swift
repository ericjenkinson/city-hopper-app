//
//  HomeScreen.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

struct HomeScreen: View {
  var body: some View {
    VStack {
      Header()
      Spacer()
      
    }
  }
}

struct Header: View {
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        BigBoldHeading(text: Constants.DevData.welcomeMessage)
          .padding(.leading)
        BigThinHeading(text: Constants.DevData.userName)
          .padding(.leading)
      }
      Spacer()
      RoundedImageViewStroked(systemName: Constants.DevData.buttonSFSymbol)
        .padding([.bottom, .trailing])
    }
    .padding(.top)
  }
}

struct HomeScreen_Previews: PreviewProvider {
  static var previews: some View {
    HomeScreen()
    HomeScreen()
      .previewLayout(.fixed(width: 568, height: 320))
    HomeScreen()
      .preferredColorScheme(.dark)
    HomeScreen()
      .previewLayout(.fixed(width: 568, height: 320))
      .preferredColorScheme(.dark)
  }
}
