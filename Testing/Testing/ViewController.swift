//
//  ViewController.swift
//  Testing
//
//  Created by David Breskvar on 07/12/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func btnAction(sender: AnyObject) {
        //let number = recursiveFib(9)
        let iterativeNumber = iterativeFib(92)
        
        //print(number)
        print(iterativeNumber)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func recursiveFib(num : Int) -> Int {
        if num == 1 || num == 2 {
            return 1
        }
        else {
            return recursiveFib(num - 1) + recursiveFib(num - 2)
        }
    }
    
    func iterativeFib(num : Int) -> Int {
        var fib1 = 1
        var fib2 = 1
        var returnNum = 1
        if num == 1 || num == 2 {
            return 1
        }
        for var i = 3; i <= num; i++ {
            returnNum = fib1 + fib2
            fib1 = fib2
            fib2 = returnNum
        }
        
        return returnNum
    }

}

