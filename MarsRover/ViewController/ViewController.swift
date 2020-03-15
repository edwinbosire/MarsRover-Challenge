//
//  ViewController.swift
//  MarsRover
//
//  Created by Edwin Bosire on 15/03/2020.
//  Copyright © 2020 Edwin Bosire. All rights reserved.
//

import UIKit

struct Cell {
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func executeInstructions(_ sender: Any) {
        
        let size = CGSize(width: 5, height: 3)
        let mars = Grid<Cell>(with: size)
        
        let robotLocation = CGPoint(x: 1, y: 1)
        let vector = Vector(location: robotLocation, orientation: .east)
        let robot = Robot(with: vector)
        
        
        let commands = "RFRFRFRF"
        
        for char in commands {
            
            let instruction = Instruction(rawValue: String(char))
            
            print(instruction)
        }
    }
    
}

