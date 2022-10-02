//
//  HorizontalButtonList.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/1/22.
//

import SwiftUI

struct HorizontalButtonList: View {
    var body: some View {
      HStack {
        Image(Category.themeParks.icon)
          .resizable()
          .scaledToFit()
          .frame(width: 28.0)
      
        Text(Category.themeParks.name)
          .foregroundColor(Constants.Colors.textColor)
          .font(.caption2)
          .bold()
      }
      .padding(8)
      .cornerRadius(12.0)
      .shadow(radius: 10)
      .border(Color.orange, width: 2)
    }
}


struct CategoryButtonIconAndText: View {
  private var category: Category
  var body: some View {
    HStack {
      Image(category.icon)
        .resizable()
        .scaledToFit()
        .frame(width: 28.0)
    
      Text(category.name)
        .foregroundColor(Constants.Colors.textColor)
        .font(.caption2)
        .bold()
    }
    .padding(8)
    .cornerRadius(12.0)
    .shadow(radius: 10)
    .border(Color.orange, width: 2)
  }
}

struct HorizontalButtonList_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalButtonList()
    }
}
