//
//  Converter.swift
//  Demo1
//
//  Created by David Breskvar on 25/10/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import Foundation

class Converter {
    static let converter = Converter()
    
    func convert(value : Double, currency : Money) -> (convertedValue : Double, convertedCurrency : Money) {
        switch currency.currency {
            case "EUR":
                return (value.EUR, currency)
            case "USD":
                return (value.USD, currency)
            case "JPY":
                return (value.JPY, currency)
            case "GBP":
                return (value.GBP, currency)
            case "CAD":
                return (value.CAD, currency)
            default:
                return (0.0, Money(currency: "Unsupported currency"))
        }
    }
}

class Money {
    var currency : String
    
    init(currency : String) {
        self.currency = currency.uppercaseString
    }
    
    init() {
        self.currency = "EUR"
    }
}

extension Double {
    var EUR : Double { return self}
    var USD : Double { return self * 1.2 }
    var JPY : Double { return self * 000 }
    var GBP : Double { return self * 000 }
    var CAD : Double { return self * 000 }
    
    func convert(value : Double, currency : Money) -> (convertedValue : Double, convertedCurrency : Money) {
        return Converter.converter.convert(value, currency: currency)
    }
    
}