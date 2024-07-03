//
//  NetworkManagerTest.swift
//  NodeLightningChallengeTests
//
//  Created by Marcelo Pastana Duarte on 03/07/24.
//

import XCTest
@testable import NodeLightningChallenge

final class MPErrorThrownTest: XCTestCase {
    func testURL() {
        // Act
        func throwsURLError() throws {
            throw MPError.invalidURL
        }

        // Assert
        XCTAssertThrowsError(try throwsURLError()) { (error) in
            XCTAssertEqual(error as? MPError, MPError.invalidURL)
        }
    }

    func testInvalidResponse() {
        // Arrange
        func throwsInvalidResponseError() throws {
            throw MPError.invalidResponse
        }

        // Assert
        XCTAssertThrowsError(try throwsInvalidResponseError()) { (error) in
            XCTAssertEqual(error as? MPError, MPError.invalidResponse)
        }
    }

    func testInvalidData() {
        // Arrange
        func throwsInvalidDataError() throws {
            throw MPError.invalidData
        }

        // Assert
        XCTAssertThrowsError(try throwsInvalidDataError()) { (error) in
            XCTAssertEqual(error as? MPError, MPError.invalidData)
        }
    }

    func testUnableToComplete() {
        // Arrange
        func throwsUnableToCompleteError() throws {
            throw MPError.unableToComplete
        }

        // Assert
        XCTAssertThrowsError(try throwsUnableToCompleteError()) { (error) in
            XCTAssertEqual(error as? MPError, MPError.unableToComplete)
        }
    }

}
