//
//  RequestCallerTests.swift
//  Credera-iOSTests
//
//  Created by Fernando Berrios on 3/16/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import XCTest
import OHHTTPStubs
import Promises

class RequestCallerTests: XCTestCase {
    
    private static let TEST_HOST = "test.example.com"
    private static let BASE_URL = "https://\(TEST_HOST)/"
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        
        OHHTTPStubs.removeAllStubs()
    }
    
    func test_callWithDecodable_whenResponseIsNotValidJson_correctErrorIsReturned() {
        
        // Arrange
        let testExpectation = expectation(description: "test_callWithDecodable_whenResponseIsNotValidJson_correctErrorIsReturned")
        
        stub(condition: isHost(RequestCallerTests.TEST_HOST)) { _ in
            let stubData = "Hello World!".data(using: String.Encoding.utf8)
            return OHHTTPStubsResponse(data: stubData!, statusCode: 200, headers: nil)
        };
        
        let request = HttpRequest(httpMethod: HttpMethod.get, path: "", baseUrl: RequestCallerTests.BASE_URL)
        let caller = RequestCaller()
        
        // Act
        let promise: Promise<TestCodable> = caller.call(request.asURLRequest())
        
        // Assert
        promise.then { value in
            // Nothing to test here
        }.catch({ error in
            testExpectation.fulfill()
            
            guard error is DecodingError else {
                XCTFail("Unknown Error type was returned")
                return
            }
        })
        
        waitForExpectations(timeout: 10)
    }
    
    func test_callWithDecodable_whenResponseIs404_correctErrorIsReturned() {
        
        // Arrange
        let testExpectation = expectation(description: "test_callWithDecodable_whenResponseIs404_correctErrorIsReturned")
        
        stub(condition: isHost(RequestCallerTests.TEST_HOST)) { _ in
            return OHHTTPStubsResponse(data: Data(), statusCode: 404, headers: nil)
        };
        
        let request = HttpRequest(httpMethod: HttpMethod.post, path: "", baseUrl: RequestCallerTests.BASE_URL)
        let caller = RequestCaller()
        
        // Act
        let promise: Promise<TestCodable> = caller.call(request.asURLRequest())
        
        // Assert
        promise.then { value in
            // Nothing to test here
            }.catch({ error in
                testExpectation.fulfill()
                
                guard error is DecodingError else {
                    XCTFail("Unknown Error type was returned")
                    return
                }
            })
        
        waitForExpectations(timeout: 10)
    }
    
}

private struct TestCodable: Codable {}
