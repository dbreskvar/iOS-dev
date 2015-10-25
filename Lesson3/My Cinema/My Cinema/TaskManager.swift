//
//  TaskManager.swift
//  My Cinema
//
//  Created by David Breskvar on 22/10/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import Foundation

class TaskManager {
    static let manager = TaskManager()
    lazy var tasks : [Movie] = []
    lazy var taskNames : [String] = []
    
    func saveTask(newTask : Movie) {
        tasks.append(newTask)
        taskNames.append(newTask.name)
        NSUserDefaults.standardUserDefaults().setObject(taskNames, forKey: "MyTasks")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}

extension TaskManager {
    
    func getTasks(priority : String) -> [Movie] {
        var priorityTasks : [Movie] = []
        
        for movie in tasks {
            if movie.priority == priority {
                priorityTasks.append(movie)
            }
        }
        
        return priorityTasks
    }
}