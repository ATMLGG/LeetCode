//
//  ViewController.swift
//  LeetCode买卖股票的最佳时机IV
//
//  Created by yyj on 2018/7/20.
//  Copyright © 2018年 yyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct Section {
        
        var start: Int
        var end: Int
        var hasProfit: Bool
        
        init() {
            self.start = 0
            self.end = 0
            self.hasProfit = false
        }
        
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
            
            var maxIndex = -1
            

            var tmpSection = Section.init()
            var maxSection = Section.init()
            
            for index in 0..<subRange.count {

                
                if subRange[index].hasProfit {
                    
                    tmpProfit = -findMin(prices, subRange[index].start, subRange[index].end, &tmpSection)
                    
                } else {
                    
                    tmpProfit = findMax(prices, subRange[index].start, subRange[index].end, &tmpSection)
                }
                
                
                if maxProfit < tmpProfit {
                    
                    maxProfit = tmpProfit
                    maxIndex = index

                    maxSection = tmpSection

                }
            }

            if maxIndex < 0 {
                
                break
            } else {
                
                let tmp = subRange[maxIndex]
                
                if tmp.hasProfit {
                    
                    subRange.append(Section.init(start: tmp.start, end:maxSection.start, hasProfit: true))
                    subRange.append(Section.init(start: maxSection.end, end: tmp.end, hasProfit: true))
                    
                    maxSection.start +=  1
                    maxSection.end -= 1
                    subRange[maxIndex] = maxSection
                    
                } else {
                    
                    
                    subRange.append(Section.init(start: tmp.start, end: maxSection.start - 1, hasProfit: false))
                    subRange.append(Section.init(start: maxSection.end + 1, end: tmp.end, hasProfit: false))

                    subRange[maxIndex] = maxSection
                    
                }
                
                totalProfit += maxProfit
                
            }
            
        }
        
        return totalProfit
    }
    
    func findMax(_ prices: [Int], _ startFlag: Int, _ endFlag: Int, _ section: inout Section) -> Int {
        
        if startFlag >= endFlag {
            return 0
        }

        section.hasProfit = true
        
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
                    section.end = i
                    section.start = tmpStartIndex
                }
            }
        }
        
        return tmpProfit
    }
    
    func findMin(_ prices: [Int], _ startFlag: Int, _ endFlag: Int, _ section: inout Section) -> Int {
        
        if startFlag >= endFlag {
            return 0
        }
        
        
        section.hasProfit = false
        
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
                    section.end = i
                    section.start = tmpStartIndex
                }
            }
        }
        
        return tmpLoss
    }
    
    
    
    
    
    
    
    
    
    
}

