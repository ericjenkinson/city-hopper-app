//
//  LocationViewModel.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/27/22.
//

import Foundation
import CoreData
import SwiftUI

@MainActor
class LocationViewModel: ObservableObject {
  let viewContext = PersistenceController.shared.container.viewContext
  let dataRetriever = DataRetriever()
  @Published var locations: [Location] = []

  init() {
    fetchLocations()
    if isEmpty() {
      Task {
        do {
          try await dataRetriever.getData()
          fetchLocations()
        } catch {
          print("error getting data")
        }
      }
    }
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

  func priceFor(location: String) -> Double {
    if locations.isEmpty {
      fetchLocations()
    }
    if let locationPrice = locations.first(where: { $0.name == location }) {
      return locationPrice.price
    } else {
      return 0.0
    }
  }

  func getLocationNames() -> [String] {
    var locationNames = [String]()
    if locations.isEmpty {
      fetchLocations()
    }

    locations.forEach {
      locationNames.append($0.name!)
    }
    return locationNames
  }
}
