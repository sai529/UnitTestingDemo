//
//  UnitTestingDemoUITests.swift
//  UnitTestingDemoUITests
//
//  Created by Aireddy Saikrishna on 01/04/21.
//

import XCTest

class UnitTestingDemoUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFormEmpty() {

        let username = app.textFields["Username"]
        XCTAssertTrue(username.exists)
        username.tap()
        let password = app.textFields["Password"]
        XCTAssertTrue(password.exists)
        password.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Submit"]/*[[".buttons[\"Submit\"].staticTexts[\"Submit\"]",".staticTexts[\"Submit\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Alert"].scrollViews.otherElements.buttons["Ok"].tap()
        

    }
    
    func testUserLoginSuccess() {

        let validUsername = "sai"
        let validPassword = "123"

        let username = app.textFields["Username"]
        XCTAssertTrue(username.exists)
        username.tap()
        username.typeText(validUsername)
        let password = app.textFields["Password"]
        XCTAssertTrue(password.exists)
        password.tap()
        password.typeText(validPassword)
        app/*@START_MENU_TOKEN@*/.staticTexts["Submit"]/*[[".buttons[\"Submit\"].staticTexts[\"Submit\"]",".staticTexts[\"Submit\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

    }

    func testUserLoginFailed() {
        let validUsername = "sai"
        let invalidPassword = "12"

        let username = app.textFields["Username"]
        XCTAssertTrue(username.exists)
        username.tap()
        username.typeText(validUsername)
        let password = app.textFields["Password"]
        XCTAssertTrue(password.exists)
        password.tap()
        password.typeText(invalidPassword)
        app/*@START_MENU_TOKEN@*/.staticTexts["Submit"]/*[[".buttons[\"Submit\"].staticTexts[\"Submit\"]",".staticTexts[\"Submit\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let alert = app.alerts["Alert"].scrollViews.otherElements.buttons["Ok"]
        XCTAssertTrue(alert.exists)
        alert.tap()
    }
    
    func testUserDetailsSuccess() {
        
        var validUsername = "sai"
        var validPassword = "123"
        
        let username = app.textFields["Username"]
        XCTAssertTrue(username.exists)
        username.tap()
        username.typeText(validUsername)
        let password = app.textFields["Password"]
        XCTAssertTrue(password.exists)
        password.tap()
        password.typeText(validPassword)
        app/*@START_MENU_TOKEN@*/.staticTexts["Submit"]/*[[".buttons[\"Submit\"].staticTexts[\"Submit\"]",".staticTexts[\"Submit\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let cell = app.tables.children(matching: .cell).element(boundBy: 0)
        cell.staticTexts["saikrishnaaireddy529@gmail.com"].tap()
        cell.staticTexts["Aireddy Saikrishna"].tap()
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
