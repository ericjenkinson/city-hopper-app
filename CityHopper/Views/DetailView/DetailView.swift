//
//  DetailView.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/10/22.
//

import SwiftUI

struct DetailView: View {
  @State var showingThingsToDo = false
  var city: City
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  var body: some View {
    GeometryReader { proxy in
      ZStack {
        Image(city.image)
          .resizable()
          .scaledToFill()
          .ignoresSafeArea(.container, edges: .top)
          .padding(.bottom)

        VStack {
          Spacer()
          CityDetails(showingThingsToDo: $showingThingsToDo, city: city)
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

struct DetailView_Previews: PreviewProvider {
  static private var city = City(name: "Munich", image: "imageMunich", country: "Germany",
                                 description: "Octoberfest!!", reviews: nil, price: 1200.00)

  static var previews: some View {
    DetailView(city: city)
    DetailView(city: city)
      .preferredColorScheme(.dark)
  }
}
