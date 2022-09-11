//
//  DetailView.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/10/22.
//

import SwiftUI

struct DetailView: View {
  @Binding var city: City
  
  var body: some View {
    Image(city.image)
      .resizable()
      .scaledToFill()
  }
}

struct DetailView_Previews: PreviewProvider {
  static private var city = Binding.constant(City(name: "Munich", image: "imageMunich", country: "Germany", description: "Octoberfest!!", reviews: nil, price: 1200.00))
  
  static var previews: some View {
    DetailView(city: city)
  }
}
