//
//  ViewController.swift
//  Weather Forcast
//
//  Created by David Breskvar on 05/11/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var city_name : String = "Ljubljana"
    var country_code : String = "SI"
    var image_code : String = "01d"
    var api_url : String?
    var img_url : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        api_url = "api.openweathermap.org/data/2.5/weather?q=\(city_name),\(country_code)"
        img_url = "http://openweathermap.org/img/w/\(image_code).png"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

