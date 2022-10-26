//
//  Trips+CoreDataProperties.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/26/22.
//

import Foundation
import CoreData

extension Trips {
  /// Public managed properties
  @NSManaged public var tripName: String
  @NSManaged public var tripDate: Date
  @NSManaged public var tripCity: String
  @NSManaged public var groupSize: Int64
  @NSManaged public var costPerPerson: Double
  @NSManaged public var totalCost: Double
  @NSManaged public var tripTaken: Bool

  static func createWith(tripName: String,
                         tripDate: Date,
                         tripCity: String,
                         groupSize: Int64,
                         costPerPerson: Double,
                         totalCost: Double,
                         tripTaken: Bool,
                         in managedObjectContext: NSManagedObjectContext) {
    let newTrip = Trips(context: managedObjectContext)
    newTrip.tripName = tripName
    newTrip.tripDate = tripDate
    newTrip.tripCity = tripCity
    newTrip.groupSize = groupSize
    newTrip.costPerPerson = costPerPerson
    newTrip.totalCost = totalCost
    newTrip.tripTaken = tripTaken

    do {
      try managedObjectContext.save()
    } catch {
      let nserror = error as NSError
      fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    }
  }
}
