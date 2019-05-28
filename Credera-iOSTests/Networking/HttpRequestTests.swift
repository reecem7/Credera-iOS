//
//  HttpRequestTests.swift
//  Credera-iOSTests
//
//  Created by Fernando Berrios on 3/19/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import XCTest

class HttpRequestTests: XCTestCase {
    
    private static let TEST_HOST = "test.example.com"
    private static let BASE_URL = "https://\(TEST_HOST)/"
    
    func test_queryItems_withNoQuery_returnsNil() {
        
        // Arrange
        let request = HttpRequest(httpMethod: HttpMethod.post, path: "", baseUrl: "")
        
        // Act
        let queryItems = request.queryItems()
        
        // Assert
        XCTAssertNil(queryItems)
    }
    
    func test_queryItems_withQueryParameters_returnsArrayWithValues() {
        
        // Arrange
        let request = HttpRequest(httpMethod: HttpMethod.post, path: "", baseUrl: "")
        request.query = ["q1": 93.91, "q2": "test value"]
        
        // Act
        let queryItems = request.queryItems()
        
        // Assert
        XCTAssertNotNil(queryItems)
        XCTAssertEqual(2, queryItems?.count)
        
    }
    
    func test_isValid_withEmptyBaseUrl_returnsFalse() {
        
        // Arrange
        let request = HttpRequest(httpMethod: HttpMethod.post, path: "", baseUrl: "")
        
        // Act
        let isValid = request.isValid()
        
        // Assert
        XCTAssertFalse(isValid)
    }
    
    func test_isValid_withNonHttpBaseUrl_returnsFalse() {
        
        // Arrange
        let request = HttpRequest(httpMethod: HttpMethod.post, path: "", baseUrl: "ftp://")
        
        // Act
        let isValid = request.isValid()
        
        // Assert
        XCTAssertFalse(isValid)
    }
    
}
