//
//  ViewController.swift
//  LeetCode石子游戏 VI
//
//  Created by young.yang on 2021/1/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NSLog("\(self.stoneGameVI([2,4,3], [1,6,7]))")
    }
    
    func stoneGameVI(_ aliceValues: [Int], _ bobValues: [Int]) -> Int {

        var realValues:[(value:Int, index:Int)] = []
        
        for i in 0..<aliceValues.count {
            
            realValues.append((aliceValues[i] + bobValues[i], i))
        }
        
        func sortNum(num1: (Int, Int), num2: (Int, Int)) -> Bool {
            return num1.0 > num2.0
        }
        
        realValues.sort(by: sortNum)
        
        var aliceTotalValue = 0, bobTotalValue = 0
        
        for i in 0..<realValues.count {
            
            if i%2 == 0 {
                
                aliceTotalValue += aliceValues[realValues[i].index]
            } else {
                
                bobTotalValue += bobValues[realValues[i].index]
            }
        }
        
        if aliceTotalValue > bobTotalValue {
            return 1
        } else if aliceTotalValue == bobTotalValue {
            return 0
        } else {
            return -1
        }
    }
}

