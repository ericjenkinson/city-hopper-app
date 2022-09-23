//
//  Group.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/28/22.
//

import Foundation

struct Group {
  var members = [Person]()
  
  mutating func addToGroup(person: Person) {
    members.append(person)
  }
  
  mutating func removeFromGroup(person: Person) {
    if members.contains(person) {
      guard let index = members.firstIndex(of: person) else { return }
      members.remove(at: index)
    }
  }
}
