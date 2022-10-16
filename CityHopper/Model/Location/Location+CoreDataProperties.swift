//
//  Location+CoreDataProperties.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/15/22.
//

import CoreData
import SwiftUI

extension Location {
  @NSManaged public var id: String?
  @NSManaged public var name: String?
  @NSManaged public var country: String?
  @NSManaged public var intro: String?
  @NSManaged public var score: Double
  @NSManaged public var price: Double
  @NSManaged public var latitude: Double
  @NSManaged public var longitude: Double
  @NSManaged public var image: Data?

  static func basicFetchRequest() -> FetchRequest<Location> {
    FetchRequest(entity: Location.entity(), sortDescriptors: [])
  }

  static func sortedNameFetchRequest() -> FetchRequest<Location> {
    let locationNameSortDescriptor = NSSortDescriptor(key: "name", ascending: true)
    return FetchRequest(entity: Location.entity(), sortDescriptors: [locationNameSortDescriptor])
  }

  static func sortedPriceAndScoreFetchRequest() -> FetchRequest<Location> {
    let locationPriceSortDescriptor = NSSortDescriptor(key: "price", ascending: false)
    let locationScoreSortDescriptor = NSSortDescriptor(key: "score", ascending: false)
    return FetchRequest(entity: Location.entity(),
                        sortDescriptors: [locationPriceSortDescriptor, locationScoreSortDescriptor])
  }

  static func sortedScoreFetchRequest() -> FetchRequest<Location> {
    let locationScoreSortDescriptor = NSSortDescriptor(key: "score", ascending: false)
    return FetchRequest(entity: Location.entity(), sortDescriptors: [locationScoreSortDescriptor])
  }
}
