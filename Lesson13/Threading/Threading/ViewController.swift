//
//  ViewController.swift
//  Threading
//
//  Created by David Breskvar on 26/11/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.progress = 0.0
        
        /*
        dispatch_async(dispatch_get_main_queue(), {
            sleep(4)
            self.progressView.progress = 0.6
        })
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(10) * Int64(NSEC_PER_SEC)), dispatch_get_main_queue(), {
            self.progressView.progress = 0.9
        })
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            self.animateProgress()
        })
        
        //animateProgress()
    }
    
    func animateProgress() {
        for var i = 0; i <= 10; i++ {
            dispatch_async(dispatch_get_main_queue(), {
                self.progressView.progress = (Float(i) / 10.0)
            })
            sleep(1)
        }
    }

}

