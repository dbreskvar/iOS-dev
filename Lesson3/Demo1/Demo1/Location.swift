//
//  Location.swift
//  Demo1
//
//  Created by David Breskvar on 26/10/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import Foundation
import CoreLocation

class Location : NSObject, CLLocationManagerDelegate {
    var mLocationManager : CLLocationManager
    var locationString : String?
    
    override init() {
        mLocationManager = CLLocationManager()
        super.init()
        mLocationManager.delegate = self
        mLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        mLocationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print (locations.first)
    }
    
    func getDetailedLocation() -> String {
        print("getting detailed location")
        
        let loc = mLocationManager.location
        let geocoder : CLGeocoder = CLGeocoder()
        
        
        if let location = loc {
            let coordinate = location.coordinate
            print("Latitude: \(coordinate.latitude) Longitude: \(coordinate.longitude)")
            geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                if error != nil {
                    print("Error je")
                }
                if placemarks?.count > 0 {
                    let pm = placemarks![0] as CLPlacemark
                    self.locationString = pm.locality!
                    print("hmm: \(self.locationString)")
                }
            })
        }
        
        if let locationString = self.locationString {
            print("hmmLoc: \(locationString) with length: \(locationString.characters.count)")
            if locationString.characters.count > 1 {
                return locationString
            }
        }
        
        return ""
    }
    
    
    
}