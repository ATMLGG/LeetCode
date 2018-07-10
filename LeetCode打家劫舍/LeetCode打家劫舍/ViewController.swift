//
//  ViewController.swift
//  LeetCode打家劫舍
//
//  Created by 杨赟鋆 on 2018/7/9.
//  Copyright © 2018年 杨赟鋆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(rob([1,2,3,1]))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rob(_ nums: [Int]) -> Int {
    
        var a = 0
        var b = 0
        
        if nums.count == 0 {
            return 0
        }
        
        if nums.count == 1 {
            return nums[0]
        }
        
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        
        for index in 0...(nums.count-1) {
            if index%2 == 0 {
                
                a = max(a + nums[index], b)
            } else {
                
                b = max(a, b + nums[index])
            }
        }
        
        return max(a, b)
        
        
        
        //更快 元祖 思路
//        var curt = 0, prev = 0
//
//        for num in nums {
//            (curt, prev) = (max(curt, prev + num), curt)
//        }
//
//        return curt

    }


}

