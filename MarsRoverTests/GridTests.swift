//
//  GridTests.swift
//  MarsRoverTests
//
//  Created by Edwin Bosire on 15/03/2020.
//  Copyright © 2020 Edwin Bosire. All rights reserved.
//

import XCTest
@testable import MarsRover

class GridTests: XCTestCase {


    func testCreationOfASquareGrid() {
        let planetSize = CGSize(width: 10, height: 10)
        let planet = Grid<Int>(with: planetSize)
        
        XCTAssertNotNil(planet, "A planet object should not be nil")
    }
    
    func testSettersForGrid() {
        let planetSize = CGSize(width: 10, height: 10)
        let planet = Grid<Int>(with: planetSize)
        
        // A 10x10 plane should have 100 items (all nil by default)
        // zero offset so the bottom left most location is planet[planetSize.width - 1, planetSize.height - 1]
        
        XCTAssert(planet[9,9] == nil, "Should be a nil")
        planet[9,9] = 100
        XCTAssertEqual(planet[9,9], 100, "location 9,9 should contain the int 100")
    }

}
