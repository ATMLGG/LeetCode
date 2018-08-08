//
//  ViewController.swift
//  LeetCode柱状图中最大的矩形
//
//  Created by yyj on 2018/8/3.
//  Copyright © 2018年 yyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        print(largestRectangleArea([2,1,5,6,2,3]))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //遍历数组,以当前高度为矩形面积高度向右延伸,计算到达边界(比当前高度小)的矩形面积
    //使用遍历会超时
    //优化思路
    //遍历高度数组,使用栈记录当前高度的索引
    //如果栈顶记录的高度小于当前高度,说明可以向右延伸,宽度加1
    //如果栈顶记录的高度大于当前高度,说明右侧到达边界,包含之前高度的最大矩形已经存在
    //此时当前高度比栈顶高度小,以栈顶高度为矩形高度向右计算矩形面积,同时将栈顶索引出栈,再次比较,直至栈顶索引的高度小于当前高度或栈为空
    //这样做的理由是,栈底部永远保存着最小高度的,用来计算宽度最宽的矩形面积
    //当出一次栈,计算一次最高高度构成的矩形面积,然后计算第二高度,向右延伸的矩形面积...最后计算最低高度,最长宽度的矩形面积
    //将计算结果取最大值,求出整个高度数组中最大面积
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

