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
        AsyncImage(url: URL(string: location.image!)) { image in
          image
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.container, edges: .top)
        } placeholder: {
          Image(systemName: "photo.fill")
        }
        VStack {
          Spacer()
          CityDetails(showingThingsToDo: $showingThingsToDo, location: location)
            .padding()
        }
      }
      .frame(width: proxy.size.width, height: proxy.size.height * 0.9)
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
