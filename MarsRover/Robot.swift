//
//  Robot.swift
//  MarsRover
//
//  Created by Edwin Bosire on 15/03/2020.
//  Copyright © 2020 Edwin Bosire. All rights reserved.
//

import UIKit

enum Orientation: CustomStringConvertible {
    case north
    case east
    case south
    case west
    
    var description: String {
        switch self {
        case .north: return "N"
        case .west: return "W"
        case .south: return "S"
        case .east: return "E"
        }
    }
}

enum Instruction {
    case left
    case right
    case forward
}

/// An object holding both the location and orientation
struct Vector: Equatable {
    var location: CGPoint
    var orientation: Orientation = .north
}

class Robot: CustomStringConvertible {
    private var vector: Vector
    var isLost = false
    
    var location: CGPoint {
        get {
            self.vector.location
        }
    }
    
    var orientation: Orientation {
        get {
            self.vector.orientation
        }
    }
    
    init(with vector: Vector) {
        self.vector = vector
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
        case .north: vector.orientation = .west
        case .west: vector.orientation = .south
        case .south: vector.orientation = . east
        case .east: vector.orientation = .north
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
        case .north: vector.orientation = .east
        case .west: vector.orientation = .north
        case .south: vector.orientation = . west
        case .east: vector.orientation = .south
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
        vector.location = newLocation
    }
    
    /// Object string description.
    /// e.g 1 12 N LOST
    var description: String {
        return "\(Int(location.x)) \(Int(location.y)) \(orientation) \(isLost ? "LOST" : "")"
    }
}
