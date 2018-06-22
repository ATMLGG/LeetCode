//
//  ViewController.swift
//  LeetCode字符频率排序
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

    
    func frequencySort(_ s: String) -> String {
        
        var dict = Dictionary<String, Int>()
        var times = Array<String>()
        
        if s.count < 3 {
            return s
        }
        
        for char in s {
            
            if var num = dict[String.init(char)] {
                num += 1
                dict[String.init(char)] = num
            }
        }
        
        
        
        
        
        
    }

}

