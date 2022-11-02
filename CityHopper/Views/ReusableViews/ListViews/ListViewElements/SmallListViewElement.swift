//
//  SmallListViewElement.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 11/1/22.
//

import SwiftUI

struct SmallListViewElement: View {
  var location: Location

  var body: some View {
    Image(location.image!)
      .resizable()
      .scaledToFill()
      .frame(width: 120, height: 120)
      .cornerRadius(20)
      .overlay(
        Text(location.name!)
          .fontWeight(.bold)
          .foregroundColor(Constants.Colors.listViewElementTextColor)
          .padding(10)
          .frame(alignment: .bottomLeading),
        alignment: .bottomLeading
      )
  }
}

//struct SmallListViewElement_Previews: PreviewProvider {
//    static var previews: some View {
//        SmallListViewElement()
//    }
//}
