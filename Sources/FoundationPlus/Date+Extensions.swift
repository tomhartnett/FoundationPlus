//
//  Date+Extensions.swift
//  FoundationPlus
//
//  Created by Tom Hartnett on 11/21/21.
//

import Foundation

public extension Date {
    /// Returns an `Int` value equal to the hour of the given date.
    var hour: Int {
        let comps = Calendar.autoupdatingCurrent.dateComponents([.hour], from: self)
        guard let hour = comps.hour else {
            fatalError("Failed to get hour of \(self)")
        }
        return hour
    }

    /// Returns an `Int` value equal to the month of the given date.
    var month: Int {
        let comps = Calendar.autoupdatingCurrent.dateComponents([.month], from: self)
        guard let month = comps.month else {
            fatalError("Failed to get month of \(self)")
        }
        return month
    }

    /// Returns an `Int` value equal to the year of the given date.
    var year: Int {
        let comps = Calendar.autoupdatingCurrent.dateComponents([.year], from: self)
        guard let year = comps.year else {
            fatalError("Failed to get year of \(self)")
        }
        return year
    }

    /// Returns the name of the month of the given date.
    var monthName: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.string(from: self)
    }

    /// Returns the `shortMonthSymbol` of the given date.
    var shortMonthSymbol: String {
        DateFormatter().shortMonthSymbols[self.month - 1]
    }

    /// Returns the `veryShortWeekdaySymbol` of the given date.
    var veryShortWeekdaySymbol: String {
        DateFormatter().veryShortWeekdaySymbols[self.weekday - 1]
    }

    /// Returns an array of `Date` values for the week of the given date. The week starts on Sunday, and the first value in the array is the Sunday of the week containing the given date.
    var weekDates: [Date] {
        guard let weekInterval = Calendar.autoupdatingCurrent.dateInterval(of: .weekOfMonth, for: self) else {
            fatalError("Failed to get week interval for \(self)")
        }

        var dates = [Date]()
        for index in 0...6 {
            guard let weekDayDate = Calendar.autoupdatingCurrent.date(byAdding: .day, value: index, to: weekInterval.start) else {
                fatalError("Failed to get week day date for \(weekInterval.start) + \(index) days")
            }
            dates.append(weekDayDate)
        }

        return dates
    }

    /// Returns an Int value equal to the weekday of the given date. The week starts on Sunday, and the weekday value for Sunday is 1.
    var weekday: Int {
        let comps = Calendar.autoupdatingCurrent.dateComponents([.weekday], from: self)
        guard let weekday = comps.weekday else {
            fatalError("Failed to get weekday of \(self)")
        }
        return weekday
    }

    /// Returns an array of `Int` values where each value is represents an hour. The array represents the previous N hours for the given date where N is the value passed in the `number` parameter. The array is sorted with the earliest hour first and the last number in the array is the hour of the given date.
    func getTrailingHours(_ number: Int) -> [Int] {
        var hours = [Int]()
        for index in 0..<number {
            guard let previousDate = Calendar.autoupdatingCurrent.date(byAdding: .hour, value: -index, to: self) else { continue }
            hours.insert(previousDate.hour, at: 0)
        }
        return hours
    }
}
