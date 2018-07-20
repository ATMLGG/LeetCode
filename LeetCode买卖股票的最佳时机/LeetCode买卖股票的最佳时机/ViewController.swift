//
//  ViewController.swift
//  LeetCode买卖股票的最佳时机
//
//  Created by yyj on 2018/7/18.
//  Copyright © 2018年 yyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         maxProfit([3,3,5,0,0,3,1,4])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //利用差价计算盈亏
    
    func maxProfit(_ prices: [Int]) -> Int {
        
        if prices.count < 2 {
            return 0
        }
        
#if false    //第一题
        
//        guard prices.count > 0 else {
//            return 0
//        }
//        var local = 0
//        var global = 0
//        for i in 1..<prices.count {
//            local = max(local+prices[i]-prices[i-1], 0)
//            global = max(global, local)
//        }
//        return global
        
        var new:[Int] = []
        for index in 0...prices.count-2 {
            
            new.append(prices[index+1] - prices[index])
        }
        
        var temp = 0
        var maxPrice = 0
        
        for price in new {
            
            if price + temp > 0 {
                
                temp += price
            } else {
                
                temp = 0
            }
            
            maxPrice = max(maxPrice, temp)
        }
        
        return maxPrice
#endif


#if true      //第二题
        
        var maxPrice = 0
        
        for index in 0...prices.count-2 {
            
            let different = prices[index+1] - prices[index]
            
            if different > 0 {
                
                maxPrice += different
            }
        
        }
        
        return maxPrice
        
#endif
        
    }


}

