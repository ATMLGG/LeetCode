//
//  ViewController.swift
//  LeetCode长度最小的子数组
//
//  Created by 杨赟鋆 on 2018/6/13.
//  Copyright © 2018年 杨赟鋆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        
        var l = 0
        var r = 0
        var sum = 0
        let nums_length = nums.count
        var min_lenghth = nums_length + 1
        
        while l < nums_length {
            
            if r < nums_length && sum < s {
                sum += nums[r]
                r += 1
                
            } else {
                sum -= nums[l]
                l += 1
            }
            
            if sum >= s {
                min_lenghth = min(min_lenghth, r - l)
            }
        }
        
        
        if min_lenghth == nums_length + 1 {
            return 0
        }
        
        return min_lenghth
        
        
    }
}

