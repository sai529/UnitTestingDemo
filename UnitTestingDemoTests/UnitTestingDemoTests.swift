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
        _ = controller.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        controller = nil
    }
    
    func testLoginStatusSuccess() {
        let successStatus = controller.checkValidation(.login)
        XCTAssertTrue(successStatus, "Login Status is true")
    }
    
    func testLoginStatusFailed() {
        let status = controller.checkValidation(.logout)
        XCTAssertFalse(status, "Login Status is false")
    }
    
    func testHttpStatusCode() {
        var searchResults = [[String:Any]]()
        let session = URLSession(configuration: .default)
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        var statusCode: Int?
        var responseErr: Error?
        XCTAssertEqual(searchResults.count, 0,"count is zero before executing service")
        let promise = expectation(description: "Status Code: 200")
        session.dataTask(with: url) { (data, res, err) in
            if let res:HTTPURLResponse = res as? HTTPURLResponse {
                statusCode = res.statusCode
                responseErr = err
            }
            if let jsonData = try? JSONSerialization.jsonObject(with: data!, options: []) as? [[String:Any]] {
                searchResults = jsonData
            }
            promise.fulfill()
        }.resume()
        wait(for: [promise], timeout: 3)
        XCTAssertNil(responseErr)
        XCTAssertEqual(statusCode, 200)
        XCTAssertEqual(searchResults.count, 100, "not equal")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
