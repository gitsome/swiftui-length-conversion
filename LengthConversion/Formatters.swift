//
//  Formatters.swift
//  LengthConversion
//
//  Created by john martin on 9/8/22.
//

import Foundation

class Formatters {
    public static var doublePrettyDecimalFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 5
        return formatter
    }
}
