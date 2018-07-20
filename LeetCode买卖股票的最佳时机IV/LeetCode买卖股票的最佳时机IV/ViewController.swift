//
//  ViewController.swift
//  LeetCode买卖股票的最佳时机IV
//
//  Created by yyj on 2018/7/20.
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

    func maxProfit(_ prices: [Int]) -> Int {
        
        if prices.count < 2 {
            return 0
        }
        
        //计算单次获利最大区间
        let receive = findMax(prices, 0, prices.count-1)
        
        //获利金额
        let profitFirst = receive.profit;
        
        //区间起始位置,将数组分成三部分,分别求第二次获利金额
        let startIndex = receive.startIndex;
        let endIndex = receive.endIndex;
        
        var subRange:[(start:Int, end:Int, isMid:Bool)] = []
        subRange.append((0, startIndex - 1, false));
        subRange.append((startIndex, endIndex, true));
        subRange.append((endIndex + 1, prices.count - 1, false));
        
        var profitSecond = 0
        
        for range in subRange {
            
            var tmpProfit = 0
            if range.isMid {
                
                //如果在第一次获利区间内,找到亏损最大的连续区间,加上这部分损失的钱,就是分两次交易后盈利的最大金额
                tmpProfit = -findMin(prices, range.start, range.end).profit
            } else {
                
                tmpProfit = findMax(prices, range.start, range.end).profit
            }
            
            profitSecond = max(profitSecond, tmpProfit)
        }
        
        
        
        return profitFirst + profitSecond
    }
    
    
    func findMax(_ prices: [Int], _ startFlag: Int, _ endFlag: Int) -> (profit: Int, startIndex: Int, endIndex: Int) {
        
        if startFlag >= endFlag {
            return (0, 0, 0)
        }
        
        var startIndex = 0
        var endIndex = 0
        
        var tmpProfit = 0;
        var tmpStartIndex = startFlag;
        
        var total = 0
        
        for i in startFlag...endFlag {
            
            total = prices[i] - prices[tmpStartIndex]
            
            if total < 0 {
                tmpStartIndex = i
                total = 0
                
            } else {
                
                if total > tmpProfit {
                    tmpProfit = total
                    endIndex = i
                    startIndex = tmpStartIndex
                }
            }
        }

        return (tmpProfit, startIndex, endIndex)
    }
    
    func findMin(_ prices: [Int], _ startFlag: Int, _ endFlag: Int) -> (profit: Int, startIndex: Int, endIndex: Int) {
        
        if startFlag >= endFlag {
            return (0, 0, 0)
        }
        
        var startIndex = 0
        var endIndex = 0
        
        var tmpLoss = 0;
        var tmpStartIndex = startFlag;
        
        var total = 0
        
        for i in startFlag...endFlag {
            
            total = prices[i] - prices[tmpStartIndex]
            
            if total > 0 {
                tmpStartIndex = i
                total = 0
                
            } else {
                
                if total < tmpLoss {
                    tmpLoss = total
                    endIndex = i
                    startIndex = tmpStartIndex
                }
            }
        }
        
        return (tmpLoss, startIndex, endIndex)
    }
    
    
    
    
    
    
    
    
    
}

