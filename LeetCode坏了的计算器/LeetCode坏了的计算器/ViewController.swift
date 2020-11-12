//
//  ViewController.swift
//  LeetCode坏了的计算器
//
//  Created by young.yang on 2020/9/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NSLog("\(self.brokenCalc(2, 3))")
        NSLog("\(self.brokenCalc(5, 8))")
        NSLog("\(self.brokenCalc(3, 10))")
        NSLog("\(self.brokenCalc(1024, 1))")
        NSLog("\(self.brokenCalc(1, 33))")
    }
    
    //正向思维 *2-1-1向前合并为 -1)*2 耗时较久
//    func brokenCalc(_ X: Int, _ Y: Int) -> Int {
//
//        var multiplyCount = 0
//        var tmpX = X
//
//        while tmpX < Y {
//
//            tmpX = tmpX * 2
//            multiplyCount += 1
//        }
//
//        if tmpX == Y {
//            return multiplyCount
//        }
//
//        var subtractCount = 0
//        while tmpX > Y {
//
//            tmpX -= 1
//            subtractCount += 1
//        }
//
//
//        var moveCount = 0
//
//        for _ in 0..<multiplyCount {
//
//            if subtractCount < 2 {
//                break
//            }
//
//            if subtractCount%2 > 0 {
//                moveCount += 1
//            }
//
//            subtractCount = subtractCount/2
//
//        }
//
//        return (subtractCount + moveCount + multiplyCount)
//    }
    
    
    //逆向思维
    func brokenCalc(_ X: Int, _ Y: Int) -> Int {
        
        var ans = 0
        var tmpY = Y
        
        while X < tmpY {
            
            ans += 1
            
            //当为奇数时,必须+1,因为题中操作为-1 *2,后者必为偶数
            if tmpY % 2 == 1 {
                
                tmpY += 1
            } else {
                
                tmpY /= 2
            }
        }
        
        return ans + X - tmpY
    }
}

