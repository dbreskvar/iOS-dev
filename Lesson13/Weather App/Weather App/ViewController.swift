//
//  ViewController.swift
//  Weather App
//
//  Created by David Breskvar on 29/11/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var cityID: UITextField!
    
    var manager = Manager.manager
    
    @IBAction func addCityByName(sender: AnyObject) {
        manager.addCity(cityName.text!, id: nil)
    }
    
    @IBAction func addCityById(sender: AnyObject) {
        manager.addCity(nil, id: Int(cityID.text!))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

