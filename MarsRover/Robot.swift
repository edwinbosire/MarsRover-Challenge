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

class Robot {
    var location: CGPoint
    var orientation: Orientation
    
    init(with location: CGPoint, orientation: Orientation = .north) {
        self.location = location
        self.orientation = orientation
    }
}
