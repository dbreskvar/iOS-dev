//
//  ViewController.swift
//  UIKitPlayground
//
//  Created by David Breskvar on 09/11/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var activityView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func changed(sender: UISwitch) {
        
        if sender.on {
            activityView.startAnimating()
            UIView.animateWithDuration(2.0, animations: { () -> Void in
                self.activityView.center = CGPointMake(20.0, 20.0)
                
                self.activityView.transform = CGAffineTransformMakeScale(2.0, 2.0)
            })
        } else {
            activityView.stopAnimating()
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.activityView.center = CGPointMake(220.0, 220.0)
                
                self.activityView.transform = CGAffineTransformIdentity
                
                }, completion: { (success) -> Void in
                    if success {
                        UIView.animateWithDuration(0.7, animations: { () -> Void in
                            self.activityView.center = self.view.center
                        })
                    } else {
                        print("Animation was unsuccessful...")
                    }
            })
        }
    }

    @IBAction func sliderChanged(sender: UISlider) {
        activityView.alpha = CGFloat(sender.value)
    }
}

