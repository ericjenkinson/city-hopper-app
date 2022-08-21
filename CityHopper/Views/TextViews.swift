//
//  TextViews.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

struct BigBoldHeading: View {
  let text: String
  
  var body: some View {
    Text(text)
      .foregroundColor(Color(Constants.Text.TextColor))
      .font(.largeTitle)
      .bold()
  }
}

struct BigThinHeading: View {
  let text: String
  var body: some View {
    Text(text)
      .fontWeight(.thin)
      .foregroundColor(Color(Constants.Text.TextColor))
      .font(.largeTitle)
  }
}

struct TextPreviews: View {
  var body: some View {
    VStack {
      BigBoldHeading(text: "Welcome, ")
      BigThinHeading(text: "Eric")
    }
  }
}


struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    TextPreviews()
    TextPreviews()
      .preferredColorScheme(.dark)
  }
}
