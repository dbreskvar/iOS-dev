//
//  DelegateExample.swift
//  My Cinema
//
//  Created by David Breskvar on 29/10/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import Foundation

@objc protocol CarDriver : NSObjectProtocol {
    func turnOnEngine ()
    
    func driveCar (loop : Int)
    
    optional func turnOffEngine (engineType : UInt, currentTime time : NSDate)
}

class CarManager {
    var delegate : CarDriver?
    
    var speed : Double {
        get {
            return 100.0
        }
        set (newValue) {
            self.speed = newValue
        }
    }
    
    var driver : Person = Person()
    lazy var passenger : Person = Person()
    
    func runCar () {
        if let driver = delegate {
            driver.turnOnEngine()
            
            for var i = 1; i < 11; i++ {
                driver.driveCar(i)
            }
            
            if (driver.respondsToSelector("turnOffEngine:time:")) {
                driver.performSelector("turnOffEngine:time:", withObject: 0, withObject: NSDate())
            }
        }
    }
    
    
}



class Person : NSObject, CarDriver {
    
    func turnOnEngine() {
        print("TURN ON ENGINE")
    }
    
    func turnOffEngine(engineType : UInt, time : NSDate?) {
        print("TURN OFF ENGINE")
    }
    
    func driveCar(loop: Int) {
        print("DRIVING MY TESLA \(loop)x")
    }
    
}

func driverExample () {
    
    let carManager = CarManager()
    
    let person = Person()
    
    carManager.delegate = person

    carManager.runCar()
    
}


