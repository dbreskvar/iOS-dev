//
//  DoubleExtension.swift
//  Demo1
//
//  Created by David Breskvar on 26/10/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import Foundation

extension Double {
    var EUR : Double { return self}
    var USD : Double { return self * 1.2 }
    var JPY : Double { return self * 000 }
    var GBP : Double { return self * 0.73 }
    var CAD : Double { return self * 000 }
    
    func convert(value : Double, currency : Money) -> (convertedValue : Double, convertedCurrency : Money) {
        return Converter.converter.convert(value, currency: currency)
    }
    
}