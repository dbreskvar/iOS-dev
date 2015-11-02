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
    
    private init() {}
    
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
