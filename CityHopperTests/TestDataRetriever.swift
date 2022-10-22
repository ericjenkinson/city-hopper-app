//
//  TestDataRetriever.swift
//  CityHopperTests
//
//  Created by Eric Jenkinson on 10/21/22.
//

import XCTest

class TestDataRetriever: XCTestCase {

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testExample() async throws {
    let dataRetriever = DataRetriever()
    dataRetriever.triposoLocationURLString = ""

    do {
      try await dataRetriever.getData()
    } catch let error {
      XCTAssertEqual("invalidURL", "\(error)")
    }
  }

}
