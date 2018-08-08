//
//  ViewController.swift
//  LeetCode最大矩形
//
//  Created by yyj on 2018/8/3.
//  Copyright © 2018年 yyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(maximalRectangle([
            ["1","0","1","0","0"],
            ["1","0","1","1","1"],
            ["1","1","1","1","1"],
            ["1","0","0","1","0"]
            ]))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //通过leetcode84可以很巧妙地理解这题
    //一行行向下遍历数组,每一列出现一个1,当做高度加1的矩形,不是1则高度清0
    //使用84题的方法逐行计算
    
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        
        if matrix.count == 0 || matrix[0].count == 0 {
            return 0
        }
        
        var heights = [Int](repeating: 0, count: matrix[0].count)
        var s = 0
        
        for i in 0..<matrix.count {
            
            for j in 0..<matrix[i].count {
                
                if matrix[i][j] == "1" {
                    
                    heights[j] += 1
                    
                } else {
                    heights[j] = 0
                }
            }
            
            s = max(s, largestRectangleArea(heights))
        }
        
        return s
    }
    
    func largestRectangleArea(_ heights: [Int]) -> Int {
        
        if heights.count == 0 {
            return 0
        }
        
        var myHeights: [Int] = heights
        myHeights.append(0)
        
        
        var s = 0
        //swift中没有栈,使用数组代替,永远操作最后一位
        var stack: [Int] = []
        var i = 0
        
        while i < myHeights.count {
            
            if stack.count == 0 || myHeights[stack.last!] < myHeights[i] {
                
                stack.append(i)
                i += 1
            } else {
                
                let j = stack.last!
                stack.removeLast()
                
                //如果栈为空,说明数组第一位即构成矩形的左侧边界,此时索引大小即矩形长度
                //如果不为空,用栈顶索引和当前索引计算矩形长度
                s = max(s, myHeights[j]*(stack.isEmpty ? i : i - 1 - stack.last!))
            }
        }
        
        return s
        
    }
    


}

