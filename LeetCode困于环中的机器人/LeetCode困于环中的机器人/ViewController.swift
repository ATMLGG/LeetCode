//
//  ViewController.swift
//  LeetCode困于环中的机器人
//
//  Created by young.yang on 2020/9/4.
//  Copyright © 2020 young.yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NSLog("result == \(self.isRobotBounded("GG"))")
    }

    func isRobotBounded(_ instructions: String) -> Bool {
        
        //东0 南1 西2 北3
        var n:[Int] = [0,0,0,0];
        
        var dirction = 3
        
        for i in 0..<instructions.count*4 {
            
            let subIndex = i%instructions.count
            
            if Array(instructions)[subIndex] == "G" {
                n[dirction] += 1
            } else if Array(instructions)[subIndex] == "L" {
                dirction = (dirction+3)%4
            } else if Array(instructions)[subIndex] == "R" {
                dirction = (dirction+1)%4
            }
        }
        
        return (n[0] == n[2] && n[1] == n[3])
    }

}
