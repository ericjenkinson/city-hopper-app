//
//  LikedCities+CoreDataProperties.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/16/22.
//
//

import CoreData
import SwiftUI

extension LikedCities {

  @NSManaged public var isLiked: Bool
  @NSManaged public var locations: Location

  static func create(withBool value: Bool, in managedObjectContext: NSManagedObjectContext) {
    let newLikedCity = self.init(context: managedObjectContext)
    newLikedCity.isLiked = value

    do {
      try managedObjectContext.save()
    } catch {
      let nserror = error as NSError
      fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    }
  }

  static func citiesLiked() -> FetchRequest<LikedCities> {
    let likedPredicate = NSPredicate(format: "%K == %@", "isLiked", NSNumber(value: true))
    return FetchRequest<LikedCities>(entity: LikedCities.entity(), sortDescriptors: [], predicate: likedPredicate)
  }

  @nonobjc public class func fetchRequest() -> NSFetchRequest<LikedCities> {
    return NSFetchRequest<LikedCities>(entityName: "LikedCities")
  }

}

extension LikedCities: Identifiable {

}
