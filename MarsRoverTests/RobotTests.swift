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

    let vectorZero = Vector(location: .zero)
    var mars: Mars?

    override func setUp() {
        mars = Mars(with: CGSize(width: 5, height: 5))
    }

    override func tearDown() {
        mars = nil
    }

    func testRobotDefaultOrientation() {
        guard let mars = mars else {
            XCTFail()
            return
        }
        let robot = Robot(with: vectorZero, in: mars)
        
        XCTAssertEqual(robot.orientation, .north, "Default orientation of robot should be North")
    }
    
    func testRobotInitialisedWithDifferentOrientation() {
        guard let mars = mars else {
            XCTFail()
            return
        }

        let robot = Robot(with: Vector(location: .zero, orientation: .west), in: mars )
        XCTAssertEqual(robot.orientation, .west, "Orientation of robot should be west")
    }
    
    func testRobotInstructionTurnLeft() {
        guard let mars = mars else {
            XCTFail()
            return
        }

        let robot = Robot(with: vectorZero, in: mars)
        
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
        guard let mars = mars else {
            XCTFail()
            return
        }

        let robot = Robot(with: vectorZero, in: mars)
        
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
        guard let mars = mars else {
            XCTFail()
            return
        }

        let robot = Robot(with: vectorZero, in: mars)
        
        XCTAssertEqual(robot.location, .zero, "Robot should be at (0,0)")
        
        robot.execute(.forward)
        XCTAssertEqual(robot.location, CGPoint(x: 0,y: 1), "Robot should be at (0,1)")

        robot.execute(.forward)
        XCTAssertEqual(robot.location, CGPoint(x: 0,y: 2), "Robot should be at (0,2)")
    }

    func testRobotInstructionToTurnRightAndMoveForward() {
        guard let mars = mars else {
            XCTFail()
            return
        }

        let robot = Robot(with: vectorZero, in: mars)
        
        robot.execute(.right)
        XCTAssertEqual(robot.location, .zero, "Robot should be at (0,0)")
        XCTAssertEqual(robot.orientation, .east, "Robot should facing east")

        robot.execute(.forward)
        XCTAssertEqual(robot.location, CGPoint(x: 1,y: 0), "Robot should be at (1,0)")

        robot.execute(.forward)
        XCTAssertEqual(robot.location, CGPoint(x: 2,y: 0), "Robot should be at (2,0)")
    }

    func testRobotInstructionToTurnLeftAndMoveForward() {
        guard let mars = mars else {
            XCTFail()
            return
        }

        let location = CGPoint(x: 4, y: 4)
        let robot = Robot(with: Vector(location: location), in: mars)
        
        robot.execute(.left)
        XCTAssertEqual(robot.location, location, "Robot should be at \(location)")
        XCTAssertEqual(robot.orientation, .west, "Robot should facing west")

        robot.execute(.forward)
        XCTAssertEqual(robot.location, CGPoint(x: 3,y: 4), "Robot should be at (4,0)")

        robot.execute(.forward)
        XCTAssertEqual(robot.location, CGPoint(x: 2,y: 4), "Robot should be at (3,0)")
    }

    func testRobotOutputIfLost() {
        guard let mars = mars else {
            XCTFail()
            return
        }

        let robot = Robot(with: Vector(location: .zero, orientation: .west), in: mars)
        
        robot.execute(.forward)
        XCTAssertTrue(robot.isLost, "Robot should be lost at (-1, 0)")
        
        XCTAssertEqual(robot.description, "-1 0 W LOST")
    }

    func testRobotOutputIfNotLost() {
        guard let mars = mars else {
            XCTFail()
            return
        }

        let robot = Robot(with: Vector(location: CGPoint(x:2,y:0), orientation: .west), in: mars)
        
        robot.execute(.forward)
        XCTAssertFalse(robot.isLost, "Robot should be at (1, 0)")
        XCTAssertEqual(robot.description, "1 0 W ")
    }
}
