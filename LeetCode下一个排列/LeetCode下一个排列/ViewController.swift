//
//  ViewController.swift
//  LeetCode下一个排列
//
//  Created by 杨赟鋆 on 2018/7/9.
//  Copyright © 2018年 杨赟鋆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var nums = [1,4,1,2,6,5,4,1]
        nextPermutation(&nums)
        print(nums)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func nextPermutation(_ nums: inout [Int]) {

        
    }

}

