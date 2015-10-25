//
//  DoubleExtension.swift
//  Demo1
//
//  Created by David Breskvar on 25/10/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import Foundation

extension Double {
    
    func convert(value : Double, currency : String) -> (convertedValue : Double, convertedCurrency : String) {
        return (value, currency)
    }
}