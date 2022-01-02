//
//  Double+Extensions.swift
//  FoundationPlus
//
//  Created by Tom Hartnett on 11/21/21.
//

import Foundation

public extension Double {
    /// Returns a `String` representation of the given `Double` value with a minimum of zero digits past the decimal point and a maximum of one.
    @available(*, deprecated,
                message: "Use the `string(maximumFractionDigits: Int, minimumFractionDigits: Int)` function instead.")
    var formattedText: String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        return formatter.string(from: NSNumber(value: self))!
    }

    /// Returns a `String` representation of the given `Double` value with the specified minimum and maximum number of digits past the decimal the
    /// decimal point.
    func string(maximumFractionDigits: Int, minimumFractionDigits: Int = 0) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = minimumFractionDigits
        formatter.maximumFractionDigits = maximumFractionDigits
        guard let string = formatter.string(from: NSNumber(value: self)) else {
            fatalError("Failed to convert to string")
        }
        return string
    }
}
