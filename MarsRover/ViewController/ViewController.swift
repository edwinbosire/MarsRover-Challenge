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

    let mars = Mars(with: CGSize(width: 5, height: 3))

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func executeInstructions(_ sender: Any) {
                
        let robotLocation = CGPoint(x: 1, y: 1)
        let vector = Vector(location: robotLocation, orientation: .east)
        let robot = Robot(with: vector)
        
        
        let commands = "RFRFRFRF"
        
        for char in commands {
            if let instruction = Instruction(rawValue: String(char)) {
                robot.execute(instruction, in: mars)
            }
        }
        
        presentAlert(with: robot.description)
    }
    
    @IBAction func executeLostInstructions(_ sender: Any) {
        
        let robotLocation = CGPoint(x: 3, y: 2)
        let vector = Vector(location: robotLocation, orientation: .north)
        let robot = Robot(with: vector)
        
        
        let commands = "FRRFLLFFRRFLL"
        
        for char in commands {
            if let instruction = Instruction(rawValue: String(char)) {
                robot.execute(instruction, in: mars)
            }
        }
        
        presentAlert(with: robot.description)

    }
    
    @IBAction func executeNotLostInstructions(_ sender: Any) {
          
          let robotLocation = CGPoint(x: 0, y: 3)
          let vector = Vector(location: robotLocation, orientation: .west)
          let robot = Robot(with: vector)
          
          
          let commands = "LLFFFLFLFL"
          
          for char in commands {
              if let instruction = Instruction(rawValue: String(char)) {
                  robot.execute(instruction, in: mars)
              }
          }
          
          presentAlert(with: robot.description)

      }
    
    func presentAlert(with message: String) {
        let alert = UIAlertController(title: "Status", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}

