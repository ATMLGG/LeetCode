//
//  ViewController.swift
//  LeetCode旋转字符串
//
//  Created by young.yang on 2020/9/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NSLog("\(self.rotateString("abcde", "cdeab"))")
        NSLog("\(self.rotateString("abcde", "abced"))")
    }

    func rotateString(_ A: String, _ B: String) -> Bool {
        
        if A.count != B.count {
            return false
        }
        
        if A.count == 0 && B.count == 0 {
            return true
        }
        
        if (A + A).contains(B) {
            return true
        }
        
        return false
    }
}

