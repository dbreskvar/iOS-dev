//
//  ViewController.swift
//  My Cinema
//
//  Created by David Breskvar on 22/10/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var taskName: UITextField!
    @IBOutlet var taskPriority: UITextField!
    @IBOutlet var taskDescription: UILabel!
    
    var manager = TaskManager()
    
    @IBAction func addTask(sender: AnyObject) {
        let name = taskName.text
        if let name = name {
            let task = Movie(name: name)
            manager.tasks?.append(task)
            taskDescription.text = "Movie: \(name) with priorty: MEDIUM"
            print(manager.tasks?.count)
        } else {
            taskDescription.text = "Invalid text input!"
        }
        
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

