//
//  ViewController.swift
//  LeetCode寻找旋转排序数组中的最小值 II
//
//  Created by yyj on 2018/7/17.
//  Copyright © 2018年 yyj. All rights reserved.
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

    
    
    func findMin(_ nums: [Int]) -> Int {
        
        if nums.count == 0 {return 0}
        if nums.count == 1 {return nums[0]}
        
        var left = 0
        var right = nums.count
        
        if nums[left] < nums[right] {
            return nums[left]
        }
        
        
        while left < right {
            
            let mid = (left + right)/2
            
            if nums[mid] >= nums[right] {
                
                left = mid + 1
                
            } else if nums[mid] < nums[left] {
                
                right = mid
            }
            
        }
        
        return nums[left]
        
        
        
    }
    

}

