//
//  CalculateBill.swift
//  Tipsy
//
//  Created by Slava Pashaliuk on 3/28/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculateBill {
    var bill: Bill?

    mutating func split(amount: Float, tipAmount: Float, numOfPeople: Int) -> Bill {
        bill = Bill(billTotal: amount, tipAmount: tipAmount, numOfPeople: numOfPeople,pricePerPerson: String(format: "%.2f", (amount * (1 + tipAmount)) / Float(numOfPeople)))
        return bill ?? Bill(billTotal: 0.0, tipAmount: 0.0, numOfPeople: 0, pricePerPerson: "0.0")
    }
}

