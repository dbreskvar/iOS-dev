//
//  Weather.swift
//  Weather App
//
//  Created by David Breskvar on 29/11/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import Foundation

class Weather {
    var id : Int
    var name : String
    var icon : String?
    var temperature : Double?
    
    init (id : Int, name : String) {
        self.id = id
        self.name = name
    }
    
}