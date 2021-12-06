//
//  DateTests.swift
//
//
//  Created by Tom Hartnett on 11/21/21.
//

@testable import FoundationPlus
import XCTest

final class DateTests: XCTestCase {
    var target: Date!

    override func setUpWithError() throws {
        try super.setUpWithError()

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        target = try XCTUnwrap(formatter.date(from: "2021-11-21 08:12:25"))
    }

    func test_hour() {
        // When, Then
        XCTAssertEqual(target.hour, 8)
    }

    func test_month() {
        // When, Then
        XCTAssertEqual(target.month, 11)
    }

    func test_monthName() {
        // When, Then
        XCTAssertEqual(target.monthName, "November")
    }

    func test_shortMonthSymbol() {
        // When, Then
        XCTAssertEqual(target.shortMonthSymbol, "Nov")
    }

    func test_veryShortWeekdaySymbol() {
        // When, Then
        XCTAssertEqual(target.veryShortWeekdaySymbol, "S")
    }

    func test_weekday() {
        // When, Then
        XCTAssertEqual(target.weekday, 1)
    }

    func test_getTrailingHours() {
        // When
        let hours = target.getTrailingHours(12)

        // Then
        XCTAssertEqual(hours, [21, 22, 23, 0, 1, 2, 3, 4, 5, 6, 7, 8])
    }

    func test_weekDates() {
        // Given
        let expectedDates: [Date] = [
            date(for: "2021-11-21"),
            date(for: "2021-11-22"),
            date(for: "2021-11-23"),
            date(for: "2021-11-24"),
            date(for: "2021-11-25"),
            date(for: "2021-11-26"),
            date(for: "2021-11-27")
        ]
        // When
        let weekDates = target.weekDates

        // Then
        XCTAssertEqual(weekDates, expectedDates)
    }
}

private extension DateTests {
    func date(for string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: string) else {
            XCTFail("Failed to convert \(string) to date")
            return Date()
        }
        return date
    }
}
