//
//  DetailView.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/10/22.
//

import SwiftUI

struct DetailView: View {
  @State var showingThingsToDo = false
  var location: Location

  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  var body: some View {
    GeometryReader { proxy in
      ZStack {
        AsyncImage(url: URL(string: location.image!)) { phase in
          switch phase {
          case .empty:
            ProgressView("Downloading Image...")
              .progressViewStyle(.circular)
              .tint(.blue)
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
        .zIndex(1)
        VStack {
          Spacer()
          CityDetails(showingThingsToDo: $showingThingsToDo, location: location)
            .padding()
        }
        .zIndex(2)
      }
      .frame(width: proxy.size.width, height: proxy.size.height * 1.15)
      .scaledToFit()
      .ignoresSafeArea(.container, edges: .top)
      .navigationBarBackButtonHidden(true)
      .navigationBarItems(leading: Button {
        self.mode.wrappedValue.dismiss()
      }label: {
        RoundedImageView(systemName: "chevron.backward", textColor: Constants.Colors.listViewElementTextColor)
          .background(
            UIBlurEffect.View(blurStyle: .regular)
          )
          .cornerRadius(Constants.General.listViewElementCornerRadius)
      })
    }
  }
}
