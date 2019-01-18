//
//  ViewController.swift
//  LeetCode二进制表示中质数个计算置位
//
//  Created by 杨赟鋆 on 2019/1/18.
//  Copyright © 2019 yyj.universal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(countPrimeSetBits(6, 13)) 
    }

    
    func countPrimeSetBits(_ L: Int, _ R: Int) -> Int {
        
        var count = 0
        
        for i in L...R {
            
            let bitCode = i.nonzeroBitCount
            if isSmallPrime(bitCode) {
                count += 1
            }
        }
        
        return count
    }
    
    func isSmallPrime(_ i: Int) -> Bool {
        
        switch i {
        case 2,3,5,7,11,13,17,19:
            return true
        default:
            return false
        }
    }

}

