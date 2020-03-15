//
//  Robot.swift
//  MarsRover
//
//  Created by Edwin Bosire on 15/03/2020.
//  Copyright © 2020 Edwin Bosire. All rights reserved.
//

import UIKit

enum Orientation {
    case north
    case east
    case south
    case west
}

enum Instruction {
    case left
    case right
    case forward
}

class Robot {
    var location: CGPoint
    var orientation: Orientation
    var isLost = false
    
    init(with location: CGPoint, orientation: Orientation = .north) {
        self.location = location
        self.orientation = orientation
    }
    
    /// Takes an Instruction object and performs pattern matching executing the stated instruction
    /// Lost robots do not respond to instructions
    ///  Returns a boolean if the instruction was executed
    ///
    /// - Parameters:
    ///   - instruction: An enum of type `Instruction`
    ///
    /// - Return:
    ///   - Bool: True or False if the instruction was executed
    func execute(_ instruction: Instruction) -> Bool {
        guard isLost == false else {
            return false
        }
        
        switch instruction {
        case .left:
            turnLeft()
        case .right:
            turnRight()
        case .forward:
            moveForward()
        }
        return true
    }
    
    private func turnLeft() {
        
    }
    
    private func turnRight() {
        
    }
    
    private func moveForward() {
        
    }
}
