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
        
        print(findMin([5,5,5,1,2,3,4,5]))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //首先还是二分,但是判断条件需要修改,因为存在重复元素,所以当mid>=left和mid<=right时无法判断最小值在哪个区间
    //只有当mid>right能够确定最小值∈[mid, right],mid<left时最小值∈[left, mid]
    //此时只能右移一位再次判断,不能采用二分
    func findMin(_ nums: [Int]) -> Int {
        
        if nums.count == 0 {return 0}
        if nums.count == 1 {return nums[0]}
        
        var left = 0
        var right = nums.count-1
        
        
        while left < right {
            
            if nums[left] < nums[right] {
                return nums[left]
            }
            
            let mid = (left + right)/2
            
            if nums[mid] > nums[right] {
                
                left = mid + 1
                
            } else if nums[mid] < nums[left] {
                
                right = mid
            } else {
                
                left += 1
            }
            
        }
        
        return nums[left]
        
        
        
    }
    

}

