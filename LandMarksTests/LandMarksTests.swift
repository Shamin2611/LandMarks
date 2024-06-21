//
//  LandMarksTests.swift
//  LandMarksTests
//
//  Created by Mostafa Shamin on 21/6/24.
//

import XCTest
@testable import LandMarks

class LandmarkListViewModelTests: XCTestCase {
    
    var viewModel: LandmarkListViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = LandmarkListViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testLoadLandmarks() {
        // Given
        let expectation = XCTestExpectation(description: "Loading landmarks")
        
        // When
        viewModel.loadLandmarks {
            // Then
            XCTAssertGreaterThan(self.viewModel.numberOfLandmarks(), 0, "Expected to load more than 0 landmarks")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testSetURLAndLoadLandmarks() {
        // Given
        guard let customURL =   Bundle.main.url(forResource: "landmarkData", withExtension: "json") else { return  } 
        let expectation = XCTestExpectation(description: "Setting custom URL and loading landmarks")
        
        // When
        viewModel.setURL(customURL)
        viewModel.loadLandmarks {
            // Then
            XCTAssertEqual(self.viewModel.numberOfLandmarks(), 12, "Expected to load exactly 12 landmarks from custom URL")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testLandmarkAtIndex() {
        // Given
        guard let customURL =   Bundle.main.url(forResource: "landmarkData", withExtension: "json") else { return  } 
        viewModel.setURL(customURL)
        
        // When
        viewModel.loadLandmarks {
            // Then
            let index = 0
            let landmark = self.viewModel.landmark(at: index)
            XCTAssertEqual(landmark.name, "Turtle Rock", "Expected the first landmark to be 'Turtle Rock'")
        }
    }
}
