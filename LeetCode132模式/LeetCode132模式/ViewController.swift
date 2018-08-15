//
//  ViewController.swift
//  LeetCode132模式
//
//  Created by yyj on 2018/8/6.
//  Copyright © 2018年 yyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        find132pattern([1,2,3,4])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    //解题思路是找到最大值和右侧第二大的值，向左侧遍历找到小于第二大的值则为true
    //但是会存在数组最大值在右侧，所以方法不可行
    //然后网上找到用栈来解决问题，想了好久理清了思路
    //其实我觉得用汉诺塔的结构来理解这道题更加形象
    
    //从右侧开始遍历数组（因为132模式找的是左侧是否存在最小值，如果是231，那就从左侧开始）
    //碰到比最上方小的盘子，就往上堆
    //如果碰到比最上方大的盘子，就把上方的盘子拿下来，直到找到可以放当前盘子的地方
    //这样能保证取下的最后一个是仅比最大值小且在最大值右侧的盘子
    //继续遍历，碰到比拿下来的盘子小的，返回true，比拿下来的盘子大的，重复上两步操作，保证构成32模式中3和2的值最大
    //到结束不存在小于当前盘子的，返回false
 
//  3      1      3        5        1      3        5          7
// ---     -     ---     -----      -     ---     -----     -------
    
//                                  -
//                                 ---
//                                -----
//                               -------
    
    
//                       -----
//                       -----                                                     ---
//                      -------
    
    
//                ---
//               -----
//               -----                                                             ---
//              -------
    
    
//       - < --- 132存在

    
    
    
    func find132pattern(_ nums: [Int]) -> Bool {
        
        var hanoi = Array<Int>.init();
        
        var medNum = Int.min
        
        for index in stride(from: nums.count-1, through: 0, by: -1) {
            
            if nums[index] < medNum {
                
                return true
            } else {
                
                while (hanoi.count > 0 && hanoi.last! < nums[index]) {
                    medNum = hanoi.last!
                    hanoi.removeLast()
                }
            }
            
            hanoi.append(nums[index])
        }
        
        return false
 
    }

}

