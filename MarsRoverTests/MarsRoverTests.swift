//
//  MarsRoverTests.swift
//  MarsRoverTests
//
//  Created by Edwin Bosire on 15/03/2020.
//  Copyright © 2020 Edwin Bosire. All rights reserved.
//

import XCTest
@testable import MarsRover

class MarsRoverTests: XCTestCase {

    var mars: Mars?

    override func setUp() {
        mars = Mars(with: CGSize(width: 5, height: 3))
    }

    override func tearDown() {
        mars = nil
    }

    func testSampleInput() {
        guard let mars = mars else {
            XCTFail()
            return
        }

        let robot1Vector = Vector(location: CGPoint(x: 1, y: 1), orientation: .east)
        let robot1 = Robot(with: robot1Vector, in: mars)

        for char in "RFRFRFRF" {
            if let instruction = Instruction(rawValue: String(char)) {
                robot1.execute(instruction)
            }
        }

        XCTAssertEqual(robot1.description, "1 1 E ", "Not expected output")
        
        
        let robot2Vector = Vector(location: CGPoint(x: 3, y: 2), orientation: .north)
        let robot2 = Robot(with: robot2Vector, in: mars)

        for char in "FRRFLLFFRRFLL" {
              if let instruction = Instruction(rawValue: String(char)) {
                  robot2.execute(instruction)
              }
          }
        XCTAssertEqual(robot2.description, "3 3 N LOST", "Not expected output")

        let robot3Vector = Vector(location: CGPoint(x: 0, y: 3), orientation: .west)
        let robot3 = Robot(with: robot3Vector, in: mars)

        for char in "LLFFFLFLFL" {
              if let instruction = Instruction(rawValue: String(char)) {
                  robot3.execute(instruction)
              }
          }
        XCTAssertEqual(robot3.description, "2 3 S ", "Not expected output")

    }
}
