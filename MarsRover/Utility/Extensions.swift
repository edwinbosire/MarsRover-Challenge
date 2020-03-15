//
//  Extensions.swift
//  MarsRover
//
//  Created by Edwin Bosire on 15/03/2020.
//  Copyright © 2020 Edwin Bosire. All rights reserved.
//

import UIKit


/// Adding an extention to the Size object to allow us to retrieve width & height in Int
public extension CGSize {
    
    /// Retrieve width as an Int
    func getWidth() -> Int {
        return Int(self.width)
    }
    
    /// Retrieve height as an Int
    func getHeight() -> Int {
        return Int(self.height)
    }

}
