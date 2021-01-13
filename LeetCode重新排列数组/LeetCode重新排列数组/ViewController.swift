//
//  ViewController.swift
//  LeetCode重新排列数组
//
//  Created by young.yang on 2020/11/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.shuffle([2,5,1,3,4,7], 3)
        self.shuffle([1,2,3,4,4,3,2,1], 4)
        self.shuffle([1,1,2,2], 2)
    }

    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        
        //76ms
        var newNums:[Int] = []

        for i in 0..<n {

            newNums.append(nums[i])
            newNums.append(nums[i + n])
        }

        return newNums
        
        
        //40ms
//        var res = [Int](repeating: 0, count: 2 * n)
//        for i in 0..<n {
//            res[i * 2] = nums[i]
//            res[i * 2 + 1] = nums[i + n]
//        }
//        return res
    }

}

