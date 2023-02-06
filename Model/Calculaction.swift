//
//  Calculaction.swift
//  MortageCalculator
//
//  Created by Artur on 27/01/2023.
//

import Foundation
struct Calculaction {
    static func Calculate(loanAmount: Double, interestRate: Double, numberOfPayments: Double) -> Double {
        var dividedRate = interestRate / 100
        dividedRate = dividedRate / 12
        let payments = numberOfPayments * 12
        
        let start = (1 + dividedRate)
        let power = Double(pow(start, payments))
        let up = power * dividedRate
        
        let divide = 1 + dividedRate
        let next = pow(divide, payments)
        let nextNext = next-1
        let almost = up / nextNext
        let final = almost * loanAmount
        return final
    }
}
