//
//  UnorderedListLabelText.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/1/22.
//

import SwiftUI

struct UnorderedListLabelText: View {
  let sfSymbol: String
  let text: String
  var body: some View {
    HStack {
      RoundedImageView(systemName: sfSymbol)
      Text(text)
        .foregroundColor(Constants.Colors.textColor)
        .kerning(Constants.General.unorderedListTextKerning)
        .font(.body)
        .bold()
      .frame(alignment: .leading)
    }
  }
}

struct UnorderedListLabelText_Previews: PreviewProvider {
    static var previews: some View {
      UnorderedListLabelText(sfSymbol: Constants.SFSymbols.walking, text: Constants.AppData.obBodyLine1)
      UnorderedListLabelText(sfSymbol: Constants.SFSymbols.airplane, text: Constants.AppData.obBodyLine3)
    }
}
