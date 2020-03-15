//
//  RobotTests.swift
//  MarsRoverTests
//
//  Created by Edwin Bosire on 15/03/2020.
//  Copyright © 2020 Edwin Bosire. All rights reserved.
//

import XCTest
@testable import MarsRover

class RobotTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRobotDefaultOrientation() {
        let robot = Robot(with: .zero)
        
        XCTAssertEqual(robot.orientation, .north, "Default orientation of robot should be North")
    }
    
    func testRobotInitialisedWithDifferentOrientation() {
        let robot = Robot(with: .zero, orientation: .west )
        XCTAssertEqual(robot.orientation, .west, "Orientation of robot should be west")
    }
    
    func testRobotInstructionTurnLeft() {
        
        let robot = Robot(with: .zero)
        
        robot.execute(.left)
        XCTAssertEqual(robot.orientation, .west, "New orientation of robot should be west")
        
        robot.execute(.left)
        XCTAssertEqual(robot.orientation, .south, "new orientation of robot should be south")
        
        robot.execute(.left)
        XCTAssertEqual(robot.orientation, .east, "new orientation of robot should be east")
        
        robot.execute(.left)
        XCTAssertEqual(robot.orientation, .north, "new orientation of robot should be north")
    }
    
    func testRobotInstructionTurnRight() {
        let robot = Robot(with: .zero)
        
        robot.execute(.right)
        XCTAssertEqual(robot.orientation, .east, "New orientation of robot should be east")
        
        robot.execute(.right)
        XCTAssertEqual(robot.orientation, .south, "new orientation of robot should be south")
        
        robot.execute(.right)
        XCTAssertEqual(robot.orientation, .west, "new orientation of robot should be west")
        
        robot.execute(.right)
        XCTAssertEqual(robot.orientation, .north, "new orientation of robot should be north")

    }

    func testRobotInstructionMoveForward() {
        let robot = Robot(with: .zero)
        
        XCTAssertEqual(robot.location, .zero, "Robot should be at (0,0)")
        
        robot.execute(.forward)
        XCTAssertEqual(robot.location, CGPoint(x: 0,y: 1), "Robot should be at (0,1)")

        robot.execute(.forward)
        XCTAssertEqual(robot.location, CGPoint(x: 0,y: 2), "Robot should be at (0,2)")
    }

    func testRobotInstructionToTurnRightAndMoveForward() {
        let robot = Robot(with: .zero)
        
        robot.execute(.right)
        XCTAssertEqual(robot.location, .zero, "Robot should be at (0,0)")
        XCTAssertEqual(robot.orientation, .east, "Robot should facing east")

        robot.execute(.forward)
        XCTAssertEqual(robot.location, CGPoint(x: 1,y: 0), "Robot should be at (1,0)")

        robot.execute(.forward)
        XCTAssertEqual(robot.location, CGPoint(x: 2,y: 0), "Robot should be at (2,0)")
    }

    func testRobotInstructionToTurnLeftAndMoveForward() {
        let location = CGPoint(x: 5, y: 5)
        let robot = Robot(with: location)
        
        robot.execute(.left)
        XCTAssertEqual(robot.location, location, "Robot should be at \(location)")
        XCTAssertEqual(robot.orientation, .west, "Robot should facing west")

        robot.execute(.forward)
        XCTAssertEqual(robot.location, CGPoint(x: 4,y: 5), "Robot should be at (4,0)")

        robot.execute(.forward)
        XCTAssertEqual(robot.location, CGPoint(x: 3,y: 5), "Robot should be at (3,0)")
    }

    func testRobotOutputIfLost() {
        let robot = Robot(with: .zero, orientation: .west)
        
        robot.execute(.forward)
        robot.isLost = true
        XCTAssertTrue(robot.isLost, "Robot should be lost at (-1, 0)")
        
        XCTAssertEqual(robot.description, "-1 0 west LOST")
    }

    func testRobotOutputIfNotLost() {
        let robot = Robot(with: CGPoint(x:2,y:0), orientation: .west)
        
        robot.execute(.forward)
        XCTAssertFalse(robot.isLost, "Robot should be at (1, 0)")
        
        XCTAssertEqual(robot.description, "1 0 west ")

    }
}
