//
//  Orientation.swift
//  MarsRover
//
//  Created by Edwin Bosire on 15/03/2020.
//  Copyright © 2020 Edwin Bosire. All rights reserved.
//

import Foundation

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
