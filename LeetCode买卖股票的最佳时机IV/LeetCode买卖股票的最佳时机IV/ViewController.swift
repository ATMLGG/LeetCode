//
//  ViewController.swift
//  LeetCode买卖股票的最佳时机IV
//
//  Created by yyj on 2018/7/20.
//  Copyright © 2018年 yyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    class Section {
        
        var start: Int
        var end: Int
        var hasProfit: Bool
        
        
        init(start: Int, end: Int, hasProfit: Bool) {
            
            self.start = start
            self.end = end
            self.hasProfit = hasProfit
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        maxProfit(2, [3,3,5,0,0,3,1,4])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        
        if prices.count < 2 {
            return 0
        }
        
        var totalProfit = 0
        

        var subRange:[Section] = []
        
        subRange.append(Section.init(start: 0, end: prices.count-1, hasProfit: false))
        
        for _ in 0..<k {
            
            
            var maxProfit = 0
            var tmpProfit = 0
            
            var maxSectionStart = 0
            var maxSectionEnd = 0
            
            var maxIndex = -1
            
            for index in 0..<subRange.count {
                
                var tmpReceive: (profit: Int, startIndex: Int, endIndex: Int)
           
                
                if subRange[index].hasProfit {
                    tmpReceive = findMin(prices, subRange[index].start, subRange[index].end)
                    tmpProfit = -tmpReceive.profit
                    
                } else {
                    
                    tmpReceive = findMax(prices, subRange[index].start, subRange[index].end)
                    tmpProfit = tmpReceive.profit
                }
                
                
                if maxProfit < tmpProfit {
                    
                    maxProfit = tmpProfit
                    maxIndex = index

                    maxSectionStart = tmpReceive.startIndex
                    maxSectionEnd = tmpReceive.endIndex

                }
            }

            if maxIndex < 0 {
                
                break
            } else {
                
                let tmp = subRange[maxIndex]
                
            
                if tmp.hasProfit {
                    
                    subRange.append(Section.init(start: tmp.start, end: maxSectionStart, hasProfit: true))
                    subRange.append(Section.init(start: maxSectionEnd, end: tmp.end, hasProfit: true))
                    
                    tmp.start = maxSectionStart + 1
                    tmp.end = maxSectionEnd - 1
                    tmp.hasProfit = false
//                    subRange[maxIndex] = tmp
                    
                } else {
                    
                    
                    subRange.append(Section.init(start: tmp.start, end: maxSectionStart - 1, hasProfit: false))
                    subRange.append(Section.init(start: maxSectionEnd + 1, end: tmp.end, hasProfit: false))
                    
                    tmp.start = maxSectionStart
                    tmp.end = maxSectionEnd
                    tmp.hasProfit = true
//                    subRange[maxIndex] = tmp
                    
                }
                
                totalProfit += maxProfit
                
            }
            
        }
        
        return totalProfit
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

