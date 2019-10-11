//
//  ViewController.swift
//  LeetCode删除排序数组中的重复项
//
//  Created by 杨赟鋆 on 2019/10/11.
//  Copyright © 2019 webeye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        var test = [0,0,1,1,1,2,2,3,3,4]
        let result = removeDuplicates(&test)
        print(result)
    }
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        if nums.count == 0 {
            return 0
        }
        
        var i = 0
        for j in 1..<nums.count {
            
            if nums[j] != nums[i] {
                i += 1
                nums[i] = nums[j]
            }
        }
        
        return i + 1
    }
}

