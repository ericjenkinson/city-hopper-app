//
//  LikedCitiesViewModel.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/31/22.
//

import Foundation
import CoreData
import SwiftUI

@MainActor
final class LikedCitiesViewModel: ObservableObject {
  let viewContext = PersistenceController.shared.container.viewContext
  let dataRetriever = DataRetriever()
  @Published var likedCities: [LikedCities] = []

  init() {
    fetchLikedCities()
  }

  private func coreDataSave() {
    do {
      try viewContext.save()
      fetchLikedCities() // update the Published var trips
    } catch {
      let nserror = error as NSError
      fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    }
  }

  func isEmpty() -> Bool {
    if likedCities.isEmpty {
      return true
    }
    return false
  }

  func numberOfLikedCities() -> Int {
    return likedCities.count
  }

  func fetchLikedCities() {
    let request = NSFetchRequest<LikedCities>(entityName: "LikedCities")
    request.predicate = NSPredicate(format: "%K == %@", "isLiked", NSNumber(value: true))

    do {
      likedCities = try viewContext.fetch(request)
    } catch let error {
      print("Error fetching Trips. \(error.localizedDescription)")
    }
  }
}
