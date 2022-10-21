//
//  TestCoreDataStack.swift
//  CityHopperTests
//
//  Created by Eric Jenkinson on 10/20/22.
//

import XCTest
import CoreData
import SwiftUI

class TestCoreDataStack: XCTestCase {

//  var context = PersistenceController.unitTests.container.viewContext

//  override func setUpWithError() throws {
//    //try await super.setUp()
//    context = PersistenceController.unitTests.container.viewContext
//  }
//
//  override func tearDownWithError() throws {
//    // super.tearDown()
//    context.
//  }

  func test_Location_LikedCity_Relationship() {
    let context = PersistenceController.unitTests.container.viewContext
    let likedCity = LikedCities(context: context)
    likedCity.isLiked = true

    Location.createWith(id: "Paris",
                        name: "Paris",
                        country: "",
                        intro: "",
                        score: 0,
                        price: 0,
                        latitude: 0,
                        longitude: 0,
                        image: Data(),
                        in: likedCity,
                        using: context)
    let fetchRequest = NSFetchRequest<LikedCities>(entityName: "LikedCities")
    fetchRequest.predicate = NSPredicate(format: "isLiked == %@", NSNumber(value: true))
    let result = try? context.fetch(fetchRequest)

    XCTAssertEqual(result?.count, 1)
  }

  func test_LikedCity_Insert() {
    let context = PersistenceController.unitTests.container.viewContext
    LikedCities.create(withBool: true, in: context)
    let fetchRequest: NSFetchRequest<LikedCities> = LikedCities.fetchRequest()
    do {
      let count = try context.count(for: fetchRequest)
      XCTAssertEqual(count, 1)
    } catch {
      XCTFail("Error in count for fetch")
    }
  }

  func test_Location_Insert() {
    let context = PersistenceController.unitTests.container.viewContext
    let likedCity = LikedCities(context: context)
    likedCity.isLiked = Bool.random()

    Location.createWith(id: "Paris",
                        name: "",
                        country: "",
                        intro: "",
                        score: 0,
                        price: 0,
                        latitude: 0,
                        longitude: 0,
                        image: Data(),
                        in: likedCity,
                        using: context)
    let fetchRequest = NSFetchRequest<Location>(entityName: "Location")
    do {
      let count = try context.count(for: fetchRequest)
      XCTAssertEqual(count, 1)
    } catch {
      XCTFail("Error in count for fetch")
    }
  }
}
