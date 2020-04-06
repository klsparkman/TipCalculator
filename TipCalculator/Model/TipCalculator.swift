//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Kelsey Sparkman on 4/6/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import Foundation

class TipCalculator {
    
    var amountBeforeTax: Double = 0
    var tipAmpount: Double = 0
    var tipPercentage: Double = 0
    var totalAmount: Double = 0
    
    init(amountBeforeTax: Double, tipPercentage: Double) {
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
    }
    
    func calculateTip() {
        tipAmpount = amountBeforeTax * tipPercentage
        totalAmount = tipAmpount + amountBeforeTax
    }
}
