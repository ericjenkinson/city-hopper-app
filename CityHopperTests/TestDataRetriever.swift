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

  func test_getData_Invalid_URL() async throws {
    let dataRetriever = DataRetriever()
    await MainActor.run {
      dataRetriever.triposoLocationURLString = ""
    }

    do {
      try await dataRetriever.getData()
    } catch let error {
      XCTAssertEqual("invalidURL", "\(error)")
    }
  }

  func test_getData_ErrorDecodingJSON() async throws {
    let dataRetriever = DataRetriever()
    await MainActor.run {
      dataRetriever.triposoLocationURLString = "https://google.com"
    }

    do {
      try await dataRetriever.getData()
    } catch let error {
      XCTAssertEqual("errorDecodingJSON", "\(error)")
    }
  }

  func test_getData_ErrorGettingResponse() async throws {
    let dataRetriever = DataRetriever()
    await MainActor.run {
      dataRetriever.triposoLocationURLString = "https://httpstat.us/500"
    }

    do {
      try await dataRetriever.getData()
    } catch let error {
      XCTAssertEqual("errorGettingResponse", "\(error)")
    }
  }

  func test_getImage_Invalid_URL() async throws {
    let dataRetriever = DataRetriever()

    do {
      _ = try await dataRetriever.getImage(at: "")
    } catch let error {
      XCTAssertEqual("invalidURL", "\(error)")
    }
  }

  func test_getImage_ErrorGettingResponse() async throws {
    let dataRetriever = DataRetriever()

    do {
      _ = try await dataRetriever.getImage(at: "https://httpstat.us/500")
    } catch let error {
      XCTAssertEqual("errorGettingResponse", "\(error)")
    }
  }

}
