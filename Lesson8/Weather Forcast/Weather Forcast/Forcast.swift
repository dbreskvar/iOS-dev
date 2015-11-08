//
//  Forcast.swift
//  Weather Forcast
//
//  Created by David Breskvar on 08/11/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import Foundation

class Forcast {
    var coord : Coordinates?
    var weather : Weather?
    var base : String?
    var main : Temperature?
    var wind : Wind?
    var clouds : Clouds?
    var dt : UInt?
    var sys : Location?
    var id : UInt?
    var name : String?
    var cod : UInt?
}

class Weather {
    var id : UInt?
    var main : String?
    var description : String?
    var icon : String?
}

class Coordinates {
    var lon : Double?
    var lat : Double?
}

class Temperature {
    var temp : Double?
    var pressure : Double?
    var humidity : Double?
    var temp_min : Double?
    var temp_max : Double?
    var sea_level : Double?
    var grnd_level : Double?
}

class Wind {
    var speed : Double?
    var deg : Double?
}

class Clouds {
    var all : Double?
}

class Location {
    var message : Double?
    var country : String?
    var sunrise : UInt?
    var sunset : UInt?
}