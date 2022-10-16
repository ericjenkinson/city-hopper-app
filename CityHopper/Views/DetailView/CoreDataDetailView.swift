//
//  DetailView.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/10/22.
//

import SwiftUI

struct CoreDataDetailView: View {
  @State var showingThingsToDo = false

  var location: Location

  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  var body: some View {
    GeometryReader { proxy in
      ZStack {
        Image(uiImage: UIImage(data: location.image!)!)
          .resizable()
          .scaledToFill()
          .ignoresSafeArea(.container, edges: .top)
          .padding(.bottom)
          // .frame(width: proxy.size.width, height: proxy.size.height * 0.6)

        VStack {
          Spacer()
          CoreDataCityDetails(showingThingsToDo: $showingThingsToDo, location: location)
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

struct CoreDataDetailView_Previews: PreviewProvider {
  static private var city = City(name: "Munich", image: "imageMunich", country: "Germany",
                                 description: "Octoberfest!!", reviews: nil, price: 1200.00)

  static var previews: some View {
    DetailView(city: city)
    DetailView(city: city)
      .preferredColorScheme(.dark)
  }
}
