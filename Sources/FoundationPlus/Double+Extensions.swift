//
//  Double+Extensions.swift
//  FoundationPlus
//
//  Created by Tom Hartnett on 11/21/21.
//

import Foundation

extension Double {
    /// Returns a `String` representation of the given `Double` value with a minimum of zero digits past the decimal point and a maximum of one.
    var formattedText: String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        return formatter.string(from: NSNumber(value: self))!
    }
}
