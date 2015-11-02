//
//  Money.swift
//  Demo1
//
//  Created by David Breskvar on 26/10/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import Foundation

func ==(lhs: Money, rhs: Money) -> Bool {
    return lhs == rhs
}

class Money : Equatable {
    var currency : String
    
    init(currency : String) {
        self.currency = currency.uppercaseString
    }
    
    init() {
        self.currency = "EUR"
    }
}