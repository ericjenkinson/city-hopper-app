//
//  CoreDataLargeListViewElement.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/16/22.
//

import SwiftUI

struct LargeListViewElement: View {
  var location: Location

  var body: some View {
    GeometryReader { geo in
//      ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
      ZStack {
        AsyncImage(url: URL(string: location.image!)) { phase in
          switch phase {
          case .empty:
            VStack {
              ProgressView("Downloading Image...")
                .progressViewStyle(.circular)
                .tint(.blue)
            }
          case .success(let image):
            image
              .resizable()
          case .failure:
            Text("Failed fetching image. Check your network connection and try again.")
              .foregroundColor(.red)
          @unknown default:
            Text("Unknown error. Please try again.")
          }
        }
        VStack {
          ListElementViewHeader(score: location.score)
            .zIndex(1)
          Spacer()
          ListElementViewFooter(city: location.name!, country: location.country!)
            .zIndex(1)
        }
      }
      .frame(maxWidth: geo.size.width * 0.9, maxHeight: geo.size.height * 0.9)
      .scaledToFill()
      .cornerRadius(Constants.General.listViewElementCornerRadius)
    }
  }
}
