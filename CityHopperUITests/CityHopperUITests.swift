//
//  CityHopperUITests.swift
//  CityHopperUITests
//
//  Created by Eric Jenkinson on 10/21/22.
//

import XCTest

class CityHopperUITests: XCTestCase {
  var app: XCUIApplication!

  override func setUpWithError() throws {
    app = XCUIApplication()
    app.launch()

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false

    // In UI tests it’s important to set the initial state - such as interface orientation -
    // required for your tests before they run. The setUp method is a good place to do this.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func test_Display_ThingToDo_Tab() throws {
    sleep(20)
    app.tabBars["Tab Bar"].buttons["Things to Do"].tap()
    XCTAssert(app.tables.staticTexts["Things to do"].exists)
  }

  func test_Display_New_Trip_View() throws {
    sleep(15)
    app.tabBars["Tab Bar"].buttons["Trips"].tap()
    app.buttons["Add New Trip"].tap()
    // swiftlint:disable:next line_length
    app.tables/*@START_MENU_TOKEN@*/.buttons["Save Trip"]/*[[".cells[\"Save Trip\"].buttons[\"Save Trip\"]",".buttons[\"Save Trip\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    XCTAssert(app.tabBars["Tab Bar"].buttons["Trips"].exists)
  }

}
