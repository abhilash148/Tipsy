//
//  Bill.swift
//  Tipsy
//
//  Created by Sai Abhilash Gudavalli on 11/05/22.
//

import Foundation

struct Bill {
    var amount: Float = 0.0
    var tipPercentage: String = "0%"
    var numberOfPersons: Int = 0
    var selectedTip: Float = 0.0
    
    mutating func updateTip(value: String) {
        if value == "0%" {
            selectedTip = 0.0
        } else if value == "10%" {
            selectedTip = 0.1
        } else if value == "20%" {
            selectedTip = 0.2
        }
        tipPercentage = value
    }
    
    mutating func calucate(amount: Float) {
        let tipAmount = (amount * selectedTip)
        self.amount = ((amount + tipAmount) / Float(numberOfPersons))
    }
    
    
    mutating func updateNumberOfPersons(value: Int) {
        self.numberOfPersons = value
    }
    
    func getAmount() -> String {
        return String(format: "%.2f", amount)
    }
    
    func getTipPercentage() -> String {
        return tipPercentage
    }
    
    func getNumberOfPersons() -> String {
        return String(numberOfPersons)
    }
}
