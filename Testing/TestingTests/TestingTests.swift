//
//  TestingTests.swift
//  TestingTests
//
//  Created by David Breskvar on 07/12/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import XCTest
@testable import Testing

class TestingTests: XCTestCase {
    
    var car : Car?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        car = Car()
        car!.make = "VW"
        car!.model = "Passat"
        car!.speed = 280.0
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        car = nil
    }
    
    func testCarString() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let string = car?.carString()
        
        XCTAssert(string == "VW Passat", "String should be equal")
        
    }
    
    func testMaxSpeed() {
        let value = car?.maxSpeed()
        XCTAssert(value == car!.speed * 1.5, "Should be higher")
    }
}
