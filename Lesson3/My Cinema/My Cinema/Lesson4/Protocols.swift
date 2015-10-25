//
//  Protocols.swift
//  My Cinema
//
//  Created by David Breskvar on 22/10/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import Foundation

struct Pravokotnik : Geometry {
    var x : Double
    var y : Double
    var width : Double
    var height : Double
    
    func ploscina() -> Double {
        return width * height
    }
    
    mutating func povecaj(faktor: Double) {
        width *= faktor
        height *= faktor
    }
}

protocol Geometry {
    func ploscina() -> Double
    
    mutating func povecaj (faktor : Double)
}

func printPravokotnik () {
    var pravokotnik1 = Pravokotnik(x: 1.0, y: 10.1, width: 30.0, height: 25.0)
    
    var pravokotnik2 = Pravokotnik(x: 5.0, y: 12.2, width: 12.9, height: 54.3)
    
    print("Ploscina 1: \(pravokotnik1.ploscina())")
    print("Ploscina 2: \(pravokotnik2.ploscina())")
    
    pravokotnik2.povecaj(3.2)
    
    print("Nova ploscina: \(pravokotnik2.ploscina())")
    
}