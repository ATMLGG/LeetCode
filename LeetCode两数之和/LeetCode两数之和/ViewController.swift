//
//  ViewController.swift
//  LeetCode两数之和
//
//  Created by yyj on 2018/6/12.
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


}

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var tempDict:Dictionary<Int, Int> = Dictionary()
        
        for (index, num) in nums.enumerated() {
            
            let tempNum = target - num
            
            guard let vaildIndex = tempDict[tempNum] else {
                tempDict[num] = index
                continue
            }
            
            return [vaildIndex, index]
        }
        
        return [-1, -1]
    }
}

