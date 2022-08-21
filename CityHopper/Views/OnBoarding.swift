//
//  OnBoarding.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

struct OnBoarding: View {
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    VStack {
      Text(Constants.AppData.appName)
      Button("Dismiss Modal") {
        presentationMode.wrappedValue.dismiss()
        
      }
    }
  }
}

struct OnBoarding_Previews: PreviewProvider {
  static var previews: some View {
    OnBoarding()
  }
}
