//
//  HorizontalButtonList.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/1/22.
//

import SwiftUI

struct CategoryButtonList: View {
    var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: -10) {
          ForEach(Category.allCases, id: \.name) { category in
            HStack {
              Button(action: {},
                     label: {
                CategoryButtonIconAndText(category: category)
              })
              .frame(width: 120)
            }
          }
        }
      }
    }
}

struct HorizontalButtonList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButtonList()
    }
}
