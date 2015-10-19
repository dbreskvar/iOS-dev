//: Playground - noun: a place where people can play

import UIKit

class Task {
    var name: String
    var added = NSDate()
    var changed = NSDate()
    var desc: String!
    
    var status: Status {
        didSet {
            self.changed = NSDate()
        }
    }
    
    var priority: Priority {
        didSet {
            self.changed = NSDate()
        }
    }
    
    func description() -> String {
        return desc
    }
    
    init(name: String, status: Status, priority : Priority) {
        self.name = name
        self.priority = priority
        self.status = status
    }
    
    convenience init(name: String) {
        self.init(name: name, status: Status.CONSIDERED, priority: Priority.MEDIUM)
    }
    
    
}

enum Status {
    case SEEN, DOWNLOADED, CONSIDERED
}

enum Priority {
    case LOW, MEDIUM, HIGH
}