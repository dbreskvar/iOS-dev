//
//  RecievedViewController.swift
//  TabBar
//
//  Created by David Breskvar on 02/11/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class RecievedViewController: UIViewController {

    @IBOutlet var displayTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: "function", name: "key", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        displayMessage()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        displayMessage()
        
    }

    func displayMessage () {
        
        
        let lastSms = NSUserDefaults.standardUserDefaults().objectForKey("lastText")
        
        if let lastSms = lastSms as? String {
            displayTextView.text = lastSms
        }
    }

}
