//
//  Grid.swift
//  MarsRover
//
//  Created by Edwin Bosire on 15/03/2020.
//  Copyright © 2020 Edwin Bosire. All rights reserved.
//

import UIKit

protocol Sizeable {
    var size: CGSize { get }
}

class Grid<T>: Sizeable {
    let size: CGSize
    private var array: Array<T?>
    
    init(with size: CGSize) {
        self.size = CGSize(width: size.width + 1, height: size.height + 1)
        self.array = Array(repeating: nil, count: Int(self.size.width) * Int(self.size.height))
    }
    
    subscript(row: Int, column: Int) -> T? {
        get {
            return array[size.getWidth()*row + column]
        }
        
        set {
            array[size.getWidth()*row + column] = newValue
        }
    }
}


class Mars {
    var grid: Grid<Cell>
    private var lostRobots = [Vector]()
    
    init(with size: CGSize) {
        self.grid = Grid<Cell>(with: size)
    }
    
    
    /// This function checks if location exists within the boundary
    ///
    /// - Parameters:
    ///     - point: CGPoint to be checked if it's within the grid
    func locationExists(at point: CGPoint) ->Bool {
        return point.x >= 0 &&
            point.x <= grid.size.width - 1  &&
            point.y >= 0 &&
            point.y <= grid.size.height - 1
    }
    
    // MARK - Manage Lost Robots
    func addLost(scent: Vector) {
        lostRobots.append(scent)
    }
    
    func contains(scent: Vector) -> Bool {
        return lostRobots.contains(scent)
    }
    
}
