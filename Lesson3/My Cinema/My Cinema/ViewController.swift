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
    
    @IBAction func saveTask(sender: AnyObject) {
        saveMovie()
    }
    @IBAction func addTask(sender: AnyObject) {
        saveMovie()
    }
    
    func saveMovie() {
        if let name = taskName.text, priority = taskPriority.text {
            if name.characters.count > 0 && priority.characters.count > 0 {
                let task = Movie(name: name, priority: priority)
                
                taskDescription.text = "Movie: '\(name)' with priorty: '\(priority)'"
                
                TaskManager.manager.saveTask(task)
            } else {
                print("Count: \(name.characters.count)")
                if name.characters.count == 0 {
                    shakeAnimation(taskName)
                } else if priority.characters.count == 0 {
                    shakeAnimation(taskPriority)
                }
                taskDescription.text = "Not enough information!"
            }
        } else {
            taskDescription.text = "Invalid text input!"
        }
    }
    
    func clearEverything() {
        taskName.text = ""
        taskPriority.text = ""
        taskDescription.text = "Inputs cleared!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO fix this code for dictionary
        
        taskName.delegate = self
        taskPriority.delegate = self
        let tasks = NSUserDefaults.standardUserDefaults().objectForKey("MyTasks") //This will crash
        
        if let tasks = tasks as? [String] {
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
    
    func shakeAnimation(object : AnyObject) {
        if let object = object as? UIView {
            print("got here")
            let center = object.frame.origin.x
            print("shaken")
            UIView.animateWithDuration(0.05, animations: { () -> Void in
                object.frame.origin.x = object.frame.origin.x + 5
                }, completion: { (success) -> Void in
                    if success {
                        UIView.animateWithDuration(0.05, animations: { () -> Void in
                            object.frame.origin.x = object.frame.origin.x - 10
                            }, completion: { (success) -> Void in
                                if success {
                                    UIView.animateWithDuration(0.05, animations: { () -> Void in
                                        object.frame.origin.x = object.frame.origin.x + 10
                                        }, completion: { (success) -> Void in
                                            UIView.animateWithDuration(0.05, animations: { () -> Void in
                                                object.frame.origin.x = object.frame.origin.x - 10
                                                }, completion: { (success) -> Void in
                                                    UIView.animateWithDuration(0.05, animations: { () -> Void in
                                                        object.frame.origin.x = object.frame.origin.x + 10
                                                        }, completion: { (success) -> Void in
                                                            UIView.animateWithDuration(0.05, animations: { () -> Void in
                                                                object.frame.origin.x = object.frame.origin.x - 10
                                                                }, completion: { (success) -> Void in
                                                                    object.frame.origin.x = center
                                                            })
                                                    })
                                            })
                                    })
                                }
                        })
                    }
            })
        }
    }

}

