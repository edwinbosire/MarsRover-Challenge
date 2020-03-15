//
//  Grid.swift
//  MarsRover
//
//  Created by Edwin Bosire on 15/03/2020.
//  Copyright © 2020 Edwin Bosire. All rights reserved.
//

import UIKit

class Grid<T> {
    let size: CGSize
    private var array: Array<T?>
    
    init(with size: CGSize) {
        self.size = size
        self.array = Array(repeating: nil, count: Int(size.width) * Int(size.height))
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

extension CGSize {
//    func toInteger() -> (width:Int, height: Int) {
//        return (width: Int(self.width), height:Int(self.height))
//    }
    
    func getWidth() -> Int {
        return Int(self.width)
    }
    
    func getHeight() -> Int {
        return Int(self.height)
    }

}
