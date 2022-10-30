//
//  CoreDataLargeListViewElement.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/16/22.
//

import SwiftUI

struct CoreDataLargeListViewElement: View {
  var location: Location

  var body: some View {
    GeometryReader { geo in
      ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
        AsyncImage(url: URL(string: location.image!)) { image in
          image.resizable()
        } placeholder: {
          Image(systemName: "photo.fill")
        }
        VStack {
          CoreDataListElementViewHeader(score: location.score)
            .zIndex(1)
          Spacer()
          ListElementViewFooter(city: location.name!, country: location.country!)
        }
      }
      .frame(maxWidth: geo.size.width * 0.9, maxHeight: geo.size.height * 0.9)
      .scaledToFit()
      .cornerRadius(Constants.General.listViewElementCornerRadius)
    }
  }
}

// struct CoreDataLargeListViewElement_Previews: PreviewProvider {
//  static var previews: some View {
//    CoreDataLargeListViewElement(location: )
//  }
// }
