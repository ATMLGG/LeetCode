//
//  ViewController.swift
//  LeetCode山脉数组的峰顶索引
//
//  Created by yyj on 2018/8/15.
//  Copyright © 2018年 yyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        peakIndexInMountainArray([0,1,0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func peakIndexInMountainArray(_ A: [Int]) -> Int {
        
        var l = 0
        var r = A.count - 1
        
        while l < r {
            
            let m = (l+r)/2
            
            if A[m] < A[m + 1] {
                l = m + 1
            } else {
                r = m
            }
        }
        
        return l
    }
}

