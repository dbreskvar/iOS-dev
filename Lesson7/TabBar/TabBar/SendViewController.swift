//
//  SendViewController.swift
//  TabBar
//
//  Created by David Breskvar on 02/11/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class SendViewController: UIViewController {

    @IBOutlet var sendTextView: UITextView!
    @IBOutlet var newMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveAction(sender: AnyObject) {
        
        let sms = sendTextView.text
        
        NSUserDefaults.standardUserDefaults().setObject(sms, forKey: "lastText")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        if (sms.characters.count > 0) {
            self.tabBarController?.selectedIndex = 1
            newMessage.text = sms
            
            //NSNotificationCenter.defaultCenter().postNotificationName("key", object : text.text!)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
