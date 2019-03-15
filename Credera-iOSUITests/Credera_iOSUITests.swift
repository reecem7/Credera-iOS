//
//  Credera_iOSUITests.swift
//  Credera-iOSUITests
//
//  Created by Zachary Slayter on 11/14/18.
//  Copyright © 2018 Credera. All rights reserved.
//

import XCTest

class Credera_iOSUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication.init()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testVCNavigation() {
        // Ensure navigation via buttons is working properly
        XCTAssert(app.staticTexts["Navigation has not been completed"].exists)
        app.buttons["Navigation Example"].tap()
        XCTAssert(app.staticTexts["This is an example of passing information from one VC to another"].exists)
        app.buttons["Navigate to final screen"].tap()
        XCTAssert(app.staticTexts["This is an example of passing information from one VC to another"].exists)
        app.buttons["Navigate back to First VC"].tap()
        XCTAssert(app.staticTexts["Navigation to Final VC has been completed"].exists)
    }
    
    func testTabBarNavigation() {
        // Ensure navigation via toolbar is working properly
        XCTAssert(app.staticTexts["MainTabBarApp: FirstViewController"].exists)
        
        // No change; already on first screen
        app.tabBars.buttons["First"].tap()
        XCTAssert(app.staticTexts["MainTabBarApp: FirstViewController"].exists)
        
        // Navigate to second tab
        app.tabBars.buttons["Second"].tap()
        XCTAssert(app.staticTexts["MainTabBarApp: SecondViewController"].exists)
    }

}
