//
//  ViewController.swift
//  LeetCode滑动窗口最大值
//
//  Created by 杨赟鋆 on 2019/1/18.
//  Copyright © 2019 yyj.universal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3)
    }
    
    
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        
        var result: [Int] = []
        
        if nums.count == 0 {
            
            return []
        } else {
            
            var max = nums[0]
            var maxIndex = 0
            
            for index in 0..<nums.count {
                
                if index <= k - 1 {
                    
                    if max < nums[index] {
                        
                        max = nums[index]
                        maxIndex = index
                    }
                    
                    if index == k - 1 {
                        
                        result.append(max)
                    }
                } else {
                    
                    if maxIndex >= index {
                        if nums[index] > max {
                            
                            max = nums[index]
                            maxIndex = index
                        }
                    } else {
                        
                    }
                    
                    
                    result.append(max)
                }
            }
            
            return result
        }
    }


}

