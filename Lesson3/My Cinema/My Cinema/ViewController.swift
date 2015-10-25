//
//  ViewController.swift
//  My Cinema
//
//  Created by David Breskvar on 22/10/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var taskName: UITextField!
    @IBOutlet var taskPriority: UITextField!
    @IBOutlet var taskDescription: UILabel!
    
    /* 
        Instead of textField use Picker onClick
    */
    
    @IBAction func addTask(sender: AnyObject) {
        if let name = taskName.text, priorty = taskPriority.text {
            let task = Movie(name: name)
            
            taskDescription.text = "Movie: '\(name)' with priorty: '\(priorty)'"
            
            TaskManager.manager.saveTask(task)
            
        } else {
            taskDescription.text = "Invalid text input!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskName.delegate = self
        taskPriority.delegate = self
        let tasks = NSUserDefaults.standardUserDefaults().objectForKey("MyTasks")
        
        if let tasks = tasks as? [String] {
            print(tasks.count)
            taskDescription.text = tasks[tasks.count - 1]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func textFieldDidEndEditing(textField: UITextField) {
        print("Text field has ended editing...")
        
        if (textField == self.taskPriority) {
            print("Priority lost focus")
        }
    }

}

