//
//  LocationViewModel.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/27/22.
//

import Foundation
import CoreData

@MainActor
class LocationViewModel: ObservableObject {
  let viewContext = PersistenceController.shared.container.viewContext

  @Published var locations: [Location] = []

  init() {
    fetchLocations()
  }

  private func coreDataSave() {
    do {
      try viewContext.save()
      fetchLocations() // update the Published var trips
    } catch {
      let nserror = error as NSError
      fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    }
  }

  func isEmpty() -> Bool {
    if locations.isEmpty {
      return true
    }
    return false
  }

  func numberOfLocations() -> Int {
    return locations.count
  }

  func fetchLocations() {
    let request = NSFetchRequest<Location>(entityName: "Location")
    do {
      locations = try viewContext.fetch(request)
    } catch let error {
      print("Error fetching Trips. \(error.localizedDescription)")
    }
  }
}
