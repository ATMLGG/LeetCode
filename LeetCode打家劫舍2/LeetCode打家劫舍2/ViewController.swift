//
//  ViewController.swift
//  LeetCode打家劫舍2
//
//  Created by 杨赟鋆 on 2018/7/9.
//  Copyright © 2018年 杨赟鋆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(rob([3,2,1,4]))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rob(_ nums: [Int]) -> Int {
        
        
        switch nums.count {
        case 0:
            return 0
            
        case 1:
            return nums[0]
            
        case 2:
            return max(nums[0], nums[1])
            
        default:
            
            
            var firstNums = Array.init(nums)
            firstNums.remove(at: firstNums.endIndex-1)
            
            var lastNums = Array.init(nums)
            lastNums.remove(at:0)
            
            var curt1 = 0, prev1 = 0
            for num in firstNums {
                (curt1, prev1) = (max(curt1, prev1 + num), curt1)
            }
            
            var curt2 = 0, prev2 = 0
            for num in lastNums {
                (curt2, prev2) = (max(curt2, prev2 + num), curt2)
            }
            
            return max(curt1, curt2)
        }

    }
    


}

