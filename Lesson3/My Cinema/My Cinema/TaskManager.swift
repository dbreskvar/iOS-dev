//
//  TaskManager.swift
//  My Cinema
//
//  Created by David Breskvar on 22/10/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import Foundation

class TaskManager : NSObject {
    static let manager = TaskManager()
    
    lazy var tasks : [Movie] = self.load()
    
    lazy var taskNames : [[String : AnyObject]] = {
        return [[String : AnyObject]] ()
    }()
    
    func load() -> [Movie] {
        var movies = [Movie]()
        let allMoviesInDict = NSUserDefaults.standardUserDefaults().objectForKey("MyTasks")
        
        if let allMoviesInDict = allMoviesInDict as? [[String : AnyObject]] {
            for movie in allMoviesInDict {
                let newMovie = Movie(dictionary: movie)
                movies.append(newMovie)
            }
        }
        return movies
    }
    
    func saveTask(newTask : Movie) {
        tasks.append(newTask)
        taskNames.append(newTask.toDictionary())
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