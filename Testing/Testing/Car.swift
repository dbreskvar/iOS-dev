//
//  Car.swift
//  Testing
//
//  Created by David Breskvar on 07/12/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class Car: NSObject {
    var model : String = "Golf"
    var make : String = "Volkswagen"
    var speed : Double = 250.0
    var engine : String = "2.0 TDI"
    var engineSpeedFactor = 1.5
    
    func carString() -> String {
        return make + " " + model
    }
    
    func maxSpeed() -> Double {
        return speed * engineSpeedFactor
    }

}
