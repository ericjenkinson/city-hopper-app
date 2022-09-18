//
//  ThingsToDo.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/18/22.
//

import SwiftUI

struct ThingsToDo: View {
  var thingsToDo: [String]
  var body: some View {
    List {
      Section(header: Text("Things to do")) {
        ForEach(thingsToDo, id: \.self) { thing in
          Text(thing)
        }
      }
    }
  }
}

struct ThingsToDo_Previews: PreviewProvider {
  static var previews: some View {
    ThingsToDo(thingsToDo: ["Sight seeing", "Theater", "Shopping", "Museums", "Live Music", "Arts and Crafts", "Theme Parks", "Convention"])
  }
}
