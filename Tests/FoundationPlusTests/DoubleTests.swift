//
//  DoubleTests.swift
//  
//
//  Created by Tom Hartnett on 11/21/21.
//

import XCTest
@testable import FoundationPlus

final class DoubleTests: XCTestCase {
    func test_formattedText_withFraction_roundedDown() {
        // Given
        let target: Double = 0.12345

        // When
        let string = target.formattedText

        // Then
        XCTAssertEqual(string, "0.1")
    }

    func test_formattedText_withFraction_roundedUp() {
        // Given
        let target: Double = 0.154321

        // When
        let string = target.formattedText

        // Then
        XCTAssertEqual(string, "0.2")
    }

    func test_formattedText_withoutFraction() {
        // Given
        let target: Double = 2.0

        // When
        let string = target.formattedText

        // Then
        XCTAssertEqual(string, "2")
    }
}
