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
  @NSManaged public var name: String
  @NSManaged public var date: Date
  @NSManaged public var city: String
  @NSManaged public var groupsize: Int64
  @NSManaged public var costperperson: Double
  @NSManaged public var totalcost: Double
  @NSManaged public var taken: Bool

  // swiftlint:disable:next function_parameter_count
  static func createWith(tripName: String,
                         tripDate: Date,
                         tripCity: String,
                         groupSize: Int64,
                         costPerPerson: Double,
                         totalCost: Double,
                         tripTaken: Bool,
                         in managedObjectContext: NSManagedObjectContext) {
    let newTrip = Trips(context: managedObjectContext)
    newTrip.name = tripName
    newTrip.date = tripDate
    newTrip.city = tripCity
    newTrip.groupsize = groupSize
    newTrip.costperperson = costPerPerson
    newTrip.totalcost = totalCost
    newTrip.taken = tripTaken

    do {
      try managedObjectContext.save()
    } catch {
      let nserror = error as NSError
      fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    }
  }
}
