//
//  ViewController.swift
//  LeetCode青蛙过河
//
//  Created by yyj on 2018/7/26.
//  Copyright © 2018年 yyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dict:Dictionary<Int, Bool> = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        canCross([0,1,3,4,5,7,9,10,12])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func canCross(_ stones: [Int]) -> Bool {
        
        let k = 0
        let pos = 0
        
        return canJump(stones, pos, k)
    }
    
    //超时原因:因为前后跳跃距离的长短会重复计算同一位置同一步幅的跳跃
    //解决方案:保存当前位置和步幅的计算状态,如果计算过,直接return
    
    func canJump(_ stones: [Int], _ position: Int, _ stride: Int) -> Bool {
        
        let key = (position|stride<<22)
            
        do {//优化判断
            
            if let value = dict[key] {
                
                return value
            }
        }
        
        for index in position+1..<stones.count {
            
            let distance = stones[index] - stones[position]
            
            if distance < stride - 1 {
                continue
            }
            
            if distance > stride + 1 {
                dict.updateValue(false, forKey: key)
                return false
            }
            
            if canJump(stones, index, distance) {
                dict.updateValue(true, forKey: key)
                return true
            }
        }

        if position == stones.count - 1 {
            
            dict.updateValue(true, forKey: position)
            return true
        } else {
            
            dict.updateValue(false, forKey: position)
            return false
        }
        
        
    }


}

