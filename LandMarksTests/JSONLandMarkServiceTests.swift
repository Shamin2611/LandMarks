//
//  JSONLandMarkServiceTests.swift
//  LandMarksTests
//
//  Created by Mostafa Shamin on 21/6/24.
//

import XCTest
@testable import LandMarks
class JSONLandmarkServiceTests: XCTestCase {
    
    var service: JSONLandmarkService!
    
    override func setUp() {
        super.setUp()
        service = JSONLandmarkService()
    }
    
    override func tearDown() {
        service = nil
        super.tearDown()
    }
    
    func testLoadLandmarksFromBundle() {
        // Given
        let expectation = XCTestExpectation(description: "Loading landmarks from bundle")
        
        // When
        let landmarks = service.loadLandmarks()
        
        // Then
        XCTAssertGreaterThan(landmarks.count, 0, "Expected to load more than 0 landmarks from bundle")
        expectation.fulfill()
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testLoadLandmarksFromCustomURL() {
        // Given
        guard let customURL =   Bundle.main.url(forResource: "landmarkData", withExtension: "json") else { return  }
        let expectation = XCTestExpectation(description: "Loading landmarks from custom URL")
        
        // When
        service.setURL(customURL)
        let landmarks = service.loadLandmarks()
        
        // Then
        XCTAssertEqual(landmarks.count, 12, "Expected to load exactly 12 landmarks from custom URL")
        expectation.fulfill()
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testLoadLandmarksFailure() {
        // Given
        guard let invalidURL = Bundle.main.url(forResource: "invalid", withExtension: "json") else { return  }
        let expectation = XCTestExpectation(description: "Loading landmarks with invalid URL")
        
        // When
        service.setURL(invalidURL)
        
        // Then
        XCTAssertThrowsError(try service.loadLandmarks(), "Expected loadLandmarks to throw an error for invalid URL") { error in
            XCTAssertEqual((error as? LocalizedError)?.errorDescription, "Failed to load landmarks.json from bundle: The data couldn’t be read because it isn’t in the correct format.")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
