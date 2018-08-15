//
//  ViewController.swift
//  LeetCode独特字符串
//
//  Created by yyj on 2018/8/8.
//  Copyright © 2018年 yyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("start")
        uniqueLetterString("ABA")
        print("end")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func uniqueLetterString(_ S: String) -> Int {
        
        var characterMap = Dictionary<Character, Array<Int>>.init()
        let mod = 1000000007
        
        for index in 0..<S.count {
            
            let c = S[String.Index.init(encodedOffset: index)]
            if var subArr = characterMap[c] {
                
                subArr.append(index)
                characterMap[c] = subArr
            } else {
                
                characterMap[c] = Array<Int>.init()
                characterMap[c]!.append(index)
            }
        }
        
        
        var count = 0
        
        for indexArr in characterMap.values {
            
            for index in 0..<indexArr.count {
                
                let prev = index == 0 ? -1 : indexArr[index-1]
                let next = index == indexArr.count - 1 ? S.count : indexArr[index+1]
                
                count = (count + (indexArr[index] - prev)*(next - indexArr[index]) % mod) % mod
            }
        }
        
        return count
    }
}
