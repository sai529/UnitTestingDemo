//
//  UnitTestingDemoTests.swift
//  UnitTestingDemoTests
//
//  Created by Aireddy Saikrishna on 01/04/21.
//

import XCTest
@testable import UnitTestingDemo

class UnitTestingDemoTests: XCTestCase {

    var controller : ViewController!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
         controller = ViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        controller = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        XCTAssertNil(controller.usernameTextField.text)
        XCTAssertNil(controller.passwordTextField.text)
        let status = controller.validateLogin("sai", "123")
        XCTAssertNil(status)
        XCTAssertTrue(status,"Login failed")
    }
    
    func testHttpStatusCode() {
        let session = URLSession(configuration: .default)
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        var statusCode: Int?
        var responseErr: Error?
        let promise = expectation(description: "Closure")
        session.dataTask(with: url) { (data, res, err) in
            if let res:HTTPURLResponse = res as? HTTPURLResponse {
                statusCode = res.statusCode
                responseErr = err
                promise.fulfill()
            }
        }.resume()
        wait(for: [promise], timeout: 5)
        XCTAssertNil(responseErr)
        XCTAssertEqual(statusCode, 200)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
