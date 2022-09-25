//
//  Group.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/28/22.
//

import Foundation

/// The Group object represents one or more Person objects. Group contains the
/// members of a group for a Trip
struct Group {
  var members = [Person]()
  
  mutating func addToGroup(person: Person) {
    members.append(person)
  }
  
  mutating func addToGroup(group: [Person]) {
    members = group
  }
  
  mutating func removeFromGroup(person: Person) {
    if members.contains(person) {
      guard let index = members.firstIndex(of: person) else { return }
      members.remove(at: index)
    }
  }
}
