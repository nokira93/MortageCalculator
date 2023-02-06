//
//  DecimalSeparator.swift
//  MortageCalculator
//
//  Created by Artur on 29/01/2023.
//

import Foundation
struct DecimalSeparator {
    static func convert(myString: String, _ index: Int, _ newChar: Character) -> String {
            var chars = Array(myString)
            chars[index] = newChar
            let modifiedString = String(chars)
            return modifiedString
        
    }
}
