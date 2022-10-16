//
//  Persistence.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/15/22.
//

import CoreData

struct PersistenceController {
  // used by the APP
  static let shared = PersistenceController()
  // used by Xcode Previews
  static var preview: PersistenceController = {
    let result = PersistenceController(inMemory: true)
    let viewContext = result.container.viewContext

    do {
      try viewContext.save()
    } catch {
      let nsError = error as NSError
      fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    }
    return result
  }()

  let container: NSPersistentContainer

  init(inMemory: Bool = false) {
    container = NSPersistentContainer(name: "Locations")

    if inMemory {
      container.persistentStoreDescriptions.first!.url =
        URL(fileURLWithPath: "/dev/null")
    }

    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        fatalError("Unresolved error\(error). \(error.userInfo)")
      }
    }

    container.viewContext.automaticallyMergesChangesFromParent = true
    container.viewContext.name = "viewContext"
    container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    container.viewContext.undoManager = nil
    container.viewContext.shouldDeleteInaccessibleFaults = true
  }
}
