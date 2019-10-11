//
//  ViewController.swift
//  LeetCode字符串的最大公因子
//
//  Created by 杨赟鋆 on 2019/10/11.
//  Copyright © 2019 webeye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(gcdOfStrings("TAUXXTAUXXTAUXXTAUXXTAUXX", "TAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXX"))
    }
    
    func gcd(_ length1: Int, _ length2: Int) -> Int {
        
        return length2 == 0 ? length1 : gcd(length2, length1%length2)
    }

    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        
        if str1 + str2 != str2 + str1 {
            return ""
        }
        
        return String(str1.prefix(gcd(str1.count, str2.count)))
    }
}

