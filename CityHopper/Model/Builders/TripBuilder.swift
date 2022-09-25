//
//  TripBuilder.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/21/22.
//


//struct Trip {
//  let id = UUID()
//  let appUserId: UUID?
//  var name = Constants.AppData.defaultTripName
//  var date = Date()
//  var members = Group()
//  var cities: [City] = []
//}

import Foundation

/// Builder of Trip objects. 
final class TripBuilder {
  
  var tripName = ""
  var tripDate = Date()
  var tripMembers: [Person] = []
  var tripCities: [City] = []
  
  public func setTripName(to name: String) {
    tripName = name
  }
  
  public func setTripDate(to date: Date) {
    tripDate = date
  }
  
  public func add(city: City) {
    tripCities.append(city)
  }
  
  public func add(person: Person) {
    tripMembers.append(person)
  }
  
  public func add(cities: [City]) {
    tripCities = cities
  }
  
  public func add(group: [Person]) {
    tripMembers = group
  }
  
}
