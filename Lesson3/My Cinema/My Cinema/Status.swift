//
//  Status.swift
//  My Cinema
//
//  Created by David Breskvar on 22/10/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import Foundation

enum Status : UInt {
    case Considered, Available, Watched, Rewatch
    
    func toRawValue() -> UInt {
        switch (self) {
        case .Considered:
            return 0
        case .Available:
            return 1
        case .Watched:
            return 2
        case .Rewatch:
            return 3
        }
    }
}
