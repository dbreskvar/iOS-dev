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
    
    var mMoney : Money = Money(currency: "USD")
    
    var manager : CLLocationManager?

    @IBOutlet var convertedValue: UILabel!
    @IBOutlet var eurValue: UITextField!
    @IBOutlet var convertBtn: UIButton!
    @IBOutlet var usdBtn: UIButton!
    @IBOutlet var jpyBtn: UIButton!
    @IBOutlet var gbpBtn: UIButton!
    @IBOutlet var locationText: UILabel!
    @IBOutlet var currencySegment: UISegmentedControl!
    
    @IBAction func segmentSelected(sender: AnyObject) {
        print("selected \(currencySegment.selectedSegmentIndex)")
        changeCurrency()
    }
    
    func changeCurrency() {
        
        let index = currencySegment.selectedSegmentIndex
        
        switch index {
        case 0:
            mMoney.currency = "USD"
            convertBtn.setTitle("Convert USD", forState: UIControlState.Normal)
        case 1:
            mMoney.currency = "JPY"
            convertBtn.setTitle("Convert JPY", forState: UIControlState.Normal)
        case 2 :
            mMoney.currency = "GBP"
            convertBtn.setTitle("Convert GBP", forState: UIControlState.Normal)
        case 3:
            mMoney.currency = "EUR"
            convertBtn.setTitle("Convert EUR", forState: UIControlState.Normal)
        default:
            mMoney.currency = "USD"
            convertBtn.setTitle("Convert USD", forState: UIControlState.Normal)
        }

    }
    
    @IBAction func getLocation(sender: AnyObject) {
        //var mLocation = Location()
        //mLocation.getDetailedLocation()
        getDetailedLocation()
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
        
        changeCurrency()
        getDetailedLocation()
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    
    func getDetailedLocation() {
        let mLocation = Location()
        
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            mLocation.mLocationManager.requestWhenInUseAuthorization()
        } else if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mLocation.mLocationManager.startUpdatingLocation()
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
                        self.locationText.text = "\(locationString), \(country)"
                        self.changeToCountryCurrency(country)
                        mLocation.mLocationManager.stopUpdatingLocation()
                    }
                })
            }
        }
    }
    
    func changeToCountryCurrency(country : String) {
        switch country {
        case "United States":
            mMoney.currency = "USD"
            convertBtn.setTitle("Convert USD", forState: UIControlState.Normal)
            currencySegment.selectedSegmentIndex = 0
        case "Slovenia", "Spain", "Portugal", "France", "Germany", "Austria":
            mMoney.currency = "EUR"
            convertBtn.setTitle("Convert EUR", forState: UIControlState.Normal)
            currencySegment.selectedSegmentIndex = 3
        case "Japan":
            mMoney.currency = "JPY"
            convertBtn.setTitle("Convert JPY", forState: UIControlState.Normal)
            currencySegment.selectedSegmentIndex = 1
        case "United Kingdom":
            mMoney.currency = "GBP"
            convertBtn.setTitle("Convert GBP", forState: UIControlState.Normal)
            currencySegment.selectedSegmentIndex = 2
        default:
            mMoney.currency = "USD"
            convertBtn.setTitle("Convert USD", forState: UIControlState.Normal)
            currencySegment.selectedSegmentIndex = 0
        }
    }
}

