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
  @NSManaged public var image: UIImage?
  @NSManaged public var thumbnail: UIImage?
}
