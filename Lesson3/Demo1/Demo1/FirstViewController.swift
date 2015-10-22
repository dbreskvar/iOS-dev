//
//  ViewController.swift
//  Demo1
//
//  Created by David Breskvar on 19/10/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var currency : String?

    @IBOutlet var convertedValue: UILabel!
    @IBOutlet var eurValue: UITextField!
    @IBOutlet var convertBtn: UIButton!
    
    @IBAction func usdConvert(sender: AnyObject) {
        currency = "USD"
        convertBtn.setTitle("Convert USD", forState: UIControlState.Normal)
    }
    
    @IBAction func jpyConvert(sender: AnyObject) {
        currency = "JPY"
        convertBtn.setTitle("Convert JPY", forState: UIControlState.Normal)
    }
    
    @IBAction func gbpConvert(sender: AnyObject) {
        currency = "GBP"
        convertBtn.setTitle("Convert GBP", forState: UIControlState.Normal)
    }
    
    
    @IBAction func convert(sender: AnyObject) {
        
        var value = eurValue.text
        
        if let value = Double(value!) {
            let dollarValue = getDollarValue("EUR", value: value)
            var returnValue : Double
            
            if let currency = currency {
                switch currency {
                case "EUR":
                    returnValue = dollarValue * 0.87873
                    break
                case "GBP":
                    returnValue = dollarValue * 0.64610
                    break
                case "JPY":
                    returnValue = dollarValue * 118.887
                    break
                case "CHF":
                    returnValue = dollarValue * 0.950958
                    break
                case "AUD":
                    returnValue = dollarValue * 1.36483
                    break
                case "USD":
                    returnValue = dollarValue
                    break
                case "CAD":
                    returnValue = dollarValue * 0.77759
                    break
                default:
                    returnValue = Double(eurValue.text!)!
                    break
                    
                }
                
                let stringValue = NSString(format: "%.2f", returnValue)
                
                convertedValue.text = "\(stringValue) \(currency)"
            } else {
                convertedValue.text = "Please select a currency to convert to"
            }
        } else {
            convertedValue.text = "Please enter a value"
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func getDollarValue(startCurrency : String, value : Double) -> Double {
        var dollarValue : Double
        
        switch startCurrency {
        case "EUR":
            dollarValue = value * 1.13836
            break
        case "GBP":
            dollarValue = value * 1.54560
            break
        case "JPY":
            dollarValue = value * 0.00841
            break
        case "CHF":
            dollarValue = value * 1.05206
            break
        case "AUD":
            dollarValue = value * 0.73282
            break
        case "CAD":
            dollarValue = value * 1.28602
            break
        default:
            dollarValue = value
            break
            
        }
        
        return dollarValue
    }

    
}

