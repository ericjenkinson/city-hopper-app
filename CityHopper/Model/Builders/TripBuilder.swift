//
//  TripBuilder.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/21/22.
//
import Foundation

/// Builder of Trip objects. 
final class TripBuilder {

  public private(set) var tripName = ""
  public private(set) var tripOwnerId = UUID()
  public private(set) var tripDate = Date()
  public private(set) var tripMembers = 1
  public private(set) var tripCities: [City] = []

  public func setTripName(to name: String) {
    tripName = name
  }

  public func setTripOwner(to id: UUID) {
    tripOwnerId = id
  }

  public func setTripDate(to date: Date) {
    tripDate = date
  }

  public func add(city: City) {
    tripCities.append(city)
  }

  public func add(cities: [City]) {
    tripCities = cities
  }

  public func add(members: Int) {
    tripMembers = members
  }

  public func build() -> Trip {
    return Trip(name: tripName,
                date: tripDate, members: tripMembers)
  }

}
