//
//  ViewController.swift
//  LeetCode范围求和II
//
//  Created by 杨赟鋆 on 2018/9/3.
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

    func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
    
        var m = m
        var n = n
        
        for op in ops {
            
            m = min(m, op[0])
            n = min(n, op[1])
            
        }
        
        return m*n
    }
}

