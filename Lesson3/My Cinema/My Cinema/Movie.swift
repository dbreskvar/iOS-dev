//
//  Movie.swift
//  My Cinema
//
//  Created by David Breskvar on 22/10/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import Foundation

class Movie {
    var name: String
    var added = NSDate()
    var changed = NSDate()
    var desc: String?
    
    var status: Status {
        didSet {
            self.changed = NSDate()
        }
    }
    
    var priority: String {
        didSet {
            self.changed = NSDate()
        }
    }
    
    func description() -> String {
        if let desc = desc {
            return desc
        } else {
            return "No description for \(self.name)"
        }
    }
    
    init(name: String, status: Status, priority : String) {
        self.name = name
        self.priority = priority
        self.status = status
    }
    
    init(dictionary : [String : AnyObject]) {
        self.name = dictionary["name"] as! String
        self.added = dictionary["added"] as! NSDate
        self.changed = dictionary["modified"] as! NSDate
        self.status = Status(rawValue: dictionary["status"] as! UInt)!
        self.priority = dictionary["priority"] as! String
    }
    
    convenience init(name: String) {
        self.init(name: name, status: Status.Considered, priority: "50")
    }
    
    func toDictionary() -> [String : AnyObject] {
        return ["name" : self.name, "added" : self.added, "modified" : self.changed, "status" : self.status.toRawValue(), "priority" : self.priority]
    }

}
