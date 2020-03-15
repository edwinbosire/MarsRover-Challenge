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

class Robot: CustomStringConvertible {
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
    @discardableResult func execute(_ instruction: Instruction) -> Bool {
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
    
    /// Turns the robot's orientation 90º Left.
    /// The following rules apply (=> implies changes to)
    ///
    /// north => west
    /// west => south
    /// south => east
    /// east => north
    private func turnLeft() {
        switch orientation {
        case .north: orientation = .west
        case .west: orientation = .south
        case .south: orientation = . east
        case .east: orientation = .north
        }
    }
    
    /// Turns the robot's orientation 90º Right.
    /// The following rules apply (=> implies changes to)
    ///
    /// north => east
    /// west => north
    /// south => west
    /// east => south
    private func turnRight() {
        switch orientation {
        case .north: orientation = .east
        case .west: orientation = .north
        case .south: orientation = . west
        case .east: orientation = .south
        }
    }
    
    /// Reads current orientation and moves one step in that direction
    /// The following rules apply
    ///
    /// if orientation == north: (x, y+1)
    /// if orientation == south: (x, y-1)
    /// if orientation == east: (x+1, y)
    /// if orientation == west: (x-1, y)
    private func moveForward() {
        var newLocation = location
        
        switch orientation {
        case .north: newLocation.y += 1
        case .south: newLocation.y -= 1
        case .east: newLocation.x += 1
        case .west: newLocation.x -= 1
        }
        location = newLocation
    }
    
    /// Object string description.
    /// e.g 1 12 N LOST
    var description: String {
        return "\(Int(location.x)) \(Int(location.y)) \(orientation) \(isLost ? "LOST" : "")"
    }
}
