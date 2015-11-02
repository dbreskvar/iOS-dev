//
//  ViewController.swift
//  Demo1
//
//  Created by David Breskvar on 19/10/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit
import CoreLocation

class FirstViewController: UIViewController, CLLocationManagerDelegate {
    
    var mMoney : Money = Money()
    
    var manager : CLLocationManager?

    @IBOutlet var convertedValue: UILabel!
    @IBOutlet var eurValue: UITextField!
    @IBOutlet var convertBtn: UIButton!
    @IBOutlet var usdBtn: UIButton!
    @IBOutlet var jpyBtn: UIButton!
    @IBOutlet var gbpBtn: UIButton!
    @IBOutlet var locationText: UILabel!
    
    @IBAction func getLocation(sender: AnyObject) {
        //var mLocation = Location()
        //mLocation.getDetailedLocation()
        getDetailedLocation()
    }
    
    @IBAction func usdConvert(sender: AnyObject) {
        mMoney.currency = "USD"
        convertBtn.setTitle("Convert USD", forState: UIControlState.Normal)
        usdBtn.selected = true
        jpyBtn.selected = false
        gbpBtn.selected = false
    }
    
    @IBAction func jpyConvert(sender: AnyObject) {
        mMoney.currency = "JPY"
        convertBtn.setTitle("Convert JPY", forState: UIControlState.Normal)
        usdBtn.selected = false
        jpyBtn.selected = true
        gbpBtn.selected = false
    }
    
    @IBAction func gbpConvert(sender: AnyObject) {
        mMoney.currency = "GBP"
        convertBtn.setTitle("Convert GBP", forState: UIControlState.Normal)
        usdBtn.selected = false
        jpyBtn.selected = false
        gbpBtn.selected = true
    }
    
    
    @IBAction func convert(sender: AnyObject) {
        
        let value = eurValue.text
        
        
        if let value = Double(value!) {
            let converted = Converter.converter.convert(value, currency: mMoney)
            convertedValue.text = "\(converted.convertedValue) \(converted.convertedCurrency.currency)"
        } else {
            convertedValue.text = "Please enter a value"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager!.delegate = self
        manager!.desiredAccuracy = kCLLocationAccuracyBest
        manager!.startUpdatingLocation()
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    
    func getDetailedLocation() {
        let mLocation = Location()
        let loc = mLocation.mLocationManager.location
        let geocoder : CLGeocoder = CLGeocoder()
        
        if let location = loc {
            //let coordinate = location.coordinate
            geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                if error != nil {
                    print("Error je")
                }
                if placemarks?.count > 0 {
                    let pm = placemarks![0] as CLPlacemark
                    let locationString = pm.locality!
                    let country = pm.country!
                    print("hmm: \(locationString), \(country)")
                    self.locationText.text = locationString
                }
            })
        }
    }
}

