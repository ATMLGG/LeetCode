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
        var countedProfit: Int?
        var countedStart: Int?
        var countedEnd: Int?
        var countedHasProfit: Bool?
        
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
        
        print(maxProfit(11, [48,12,60,93,97,42,25,64,17,56,85,93,9,48,52,42,58,85,81,84,69,36,1,54,23,15,72,15,11,94]))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //优化思路:由于需要计算每个区间的盈利,便利过程中会有大量重复计算
    //记录每个区间的盈利数额和子区间,若果计算过就直接获取,避免重复计算
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
            
            var maxSection = Section.init()
            
            for index in 0..<subRange.count {
                
                var tmpSection = Section.init()
                
                if let countedProfit = subRange[index].countedProfit {

                    tmpProfit = countedProfit
                    
                    tmpSection.start = subRange[index].countedStart!
                    tmpSection.end = subRange[index].countedEnd!
                    tmpSection.hasProfit = subRange[index].countedHasProfit!
                    
                } else {
                    if subRange[index].hasProfit {
                        
                        tmpProfit = -findMin(prices, subRange[index].start, subRange[index].end, &tmpSection)

                    } else {
                        
                        tmpProfit = findMax(prices, subRange[index].start, subRange[index].end, &tmpSection)
                    }
                    
                    
                    subRange[index].countedProfit = tmpProfit
                    subRange[index].countedStart = tmpSection.start
                    subRange[index].countedEnd = tmpSection.end
                    subRange[index].countedHasProfit = tmpSection.hasProfit
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
                
                
                maxSection.countedProfit = nil
                maxSection.countedStart = nil
                maxSection.countedEnd = nil
                
                if tmp.hasProfit {
                    
                    if maxSection.start > tmp.start {
                        subRange.append(Section.init(start: tmp.start, end:maxSection.start, hasProfit: true))
                    }
                    
                    if maxSection.end < tmp.end {
                        subRange.append(Section.init(start: maxSection.end, end: tmp.end, hasProfit: true))
                    }

                    maxSection.start += 1
                    maxSection.end -= 1
                    
                    if maxSection.start < maxSection.end {
                        subRange[maxIndex] = maxSection
                    } else {
                        subRange.remove(at: maxIndex)
                    }
                    
                    
                } else {
                    
                    if tmp.start < maxSection.start - 1 {
                        subRange.append(Section.init(start: tmp.start, end: maxSection.start - 1, hasProfit: false))
                    }
                    
                    if maxSection.end + 1 < tmp.end {
                        subRange.append(Section.init(start: maxSection.end + 1, end: tmp.end, hasProfit: false))
                    }
                    
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

