//
//  ViewController.swift
//  LeetCode132模式
//
//  Created by yyj on 2018/8/6.
//  Copyright © 2018年 yyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        find132pattern([-2,1,2,-2,1,2])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func find132pattern(_ nums: [Int]) -> Bool {
        
        var maxNum = Int.min
        var medNum = Int.min
        
        for index in stride(from: nums.count-1, through: 0, by: -1) {
            
            if nums[index] < medNum {
                return true
            }
            
            if maxNum < nums[index] {
                
                medNum = maxNum
                maxNum = nums[index]
            } else if nums[index] > medNum {
                
                medNum = nums[index]
            }
        }
        
        return false
 
    }

}

