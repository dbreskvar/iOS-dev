//
//  BillExtension.swift
//  mTrader
//
//  Created by David Breskvar on 08/12/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import Foundation

extension BillManager {
    @nonobjc static var iPay : Bool = false
    @nonobjc static var total : Double = 450.0
    
    func calculateValues() {
        var total = BillManager.total
        var count = BillManager.manager.addedSplitters.count
        if BillManager.iPay {
            count++;
        }
        
        var values : Double = 0.0;
        for split in BillManager.manager.addedSplitters {
            if split.isEdited {
                values += split.price;
                count--;
            }
        }
        
        total -= values;
        let avg = (total / Double(count))
        
        for var i = 0; i < BillManager.manager.addedSplitters.count; i++ {
            if !BillManager.manager.addedSplitters[i].isEdited {
                BillManager.manager.addedSplitters[i].price = avg
            }
        }

    }
    
    func deselectedAddedSplitter(splitter : Splitter) {
        for var i = 0; i < BillManager.manager.addedSplitters.count; i++ {
            if splitter.mobile == BillManager.manager.addedSplitters[i].mobile {
                BillManager.manager.addedSplitters.removeAtIndex(i)
                calculateValues()
                break
            }
        }
    }
    
    func addSplitter(splitter : Splitter) {
        var shouldAdd : Bool = true
        for existed in BillManager.manager.addedSplitters {
            if existed.mobile == splitter.mobile {
                shouldAdd = false
                break;
            }
        }
        if shouldAdd {
            BillManager.manager.addedSplitters.append(splitter)
            calculateValues()
        }
    }
}