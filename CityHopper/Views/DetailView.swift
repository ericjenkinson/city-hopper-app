//
//  DetailView.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/10/22.
//

import SwiftUI

struct DetailView: View {
  @State var showingThingsToDo = false
  @Binding var city: City
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

struct CityDetails: View {
  @Binding var showingThingsToDo: Bool
  var city: City
  var body: some View {
    VStack(spacing: 0.0) {
      HStack {
        Text(city.name)
          .foregroundColor(Constants.Colors.listViewElementTextColor)
        Spacer()
        Text(String(city.price))
          .foregroundColor(Constants.Colors.listViewElementTextColor)
      }
      HStack() {
        HStack() {
          RoundedImageView(systemName: "location", textColor: Constants.Colors.listViewElementTextColor)
            .padding(-10)
          Text(city.country)
            .foregroundColor(Constants.Colors.listViewElementTextColor)
            .padding(-10)
        }
    
        Spacer()
        Text("/ per person")
          .foregroundColor(Constants.Colors.listViewElementTextColor)
        
      }
      HStack {
        Button(action: {
          withAnimation {
            self.showingThingsToDo.toggle()
          }
        }) {
          ButtonText(text: "Things to do!")
            
        }.sheet(isPresented: $showingThingsToDo) {
          ThingsToDo(thingsToDo: city.thingsToDo)
        }
        
      }
    }
    .padding()
    .background(
      UIBlurEffect.View(blurStyle: .regular)
    )
    .cornerRadius(Constants.General.detailViewCityDetailsCornerRadius)
  }
}

struct DetailView_Previews: PreviewProvider {
  static private var city = Binding.constant(City(name: "Munich", image: "imageMunich", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00))
  
  static var previews: some View {
    DetailView(city: city)
    DetailView(city: city)
      .preferredColorScheme(.dark)
  }
}
