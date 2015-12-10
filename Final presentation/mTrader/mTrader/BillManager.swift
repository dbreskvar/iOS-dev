//
//  BillManager.swift
//  mTrader
//
//  Created by David Breskvar on 08/12/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import Foundation


class BillManager : NSObject {
    
    static let manager = BillManager()
    
    lazy var splitters : [Splitter] = self.loadSplitters()
    
    var addedSplitters : [Splitter] = [Splitter]()
    
    
    func loadSplitters() -> [Splitter] {
        var mSplitters : [Splitter] = [Splitter]()
        
        let one = Splitter()
        one.name = "Jernej Beljak"
        one.mobile = "+386 31 574 534"
        let two = Splitter()
        two.name = "Teo Mirca"
        two.mobile = "+386 51 260 351"
        let three = Splitter()
        three.name = "Kristan Cer"
        three.mobile = "+386 40 425 070"
        let four = Splitter()
        four.name = "Janja Pelanec"
        four.mobile = "+386 70 233 018"
        let five = Splitter()
        five.name = "Luka Dobravec"
        five.mobile = "+386 31 855 471"
        let six = Splitter()
        six.name = "Rebeka Koral"
        six.mobile = "+386 41 442 513"
        let seven = Splitter()
        seven.name = "Kiha Motnik"
        seven.mobile = "+386 40 848 505"
        let eight = Splitter()
        eight.name = "Tanja Gomilar"
        eight.mobile = "+386 41 415 733"
        let nine = Splitter()
        nine.name = "David Breskvar"
        nine.mobile = "+386 51 224 000"
        let ten = Splitter()
        ten.name = "Andrej Breskvar"
        ten.mobile = "+386 31 224 000"
        
        mSplitters.append(one)
        mSplitters.append(two)
        mSplitters.append(three)
        mSplitters.append(four)
        mSplitters.append(five)
        mSplitters.append(six)
        mSplitters.append(seven)
        mSplitters.append(eight)
        mSplitters.append(nine)
        mSplitters.append(ten)
        
        return mSplitters
    }
    
}