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
        uniqueLetterString("ABA")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func uniqueLetterString(_ S: String) -> Int {
        
        var characterMap = Dictionary<String, Array<Int>>.init()
        
        for index in 0..<S.count {
            
            let c = S.characterOfIndex(index: index)
            
            if var subArr = characterMap[c] {
                
                subArr.append(index)
                characterMap[String.init(c)] = subArr
            } else {
                
                characterMap[String.init(c)] = Array<Int>.init()
                characterMap[String.init(c)]!.append(index)
            }
        }
        
        
        var count = 0
        
        for indexArr in characterMap.values {
            
            for index in 0..<indexArr.count {
                
                let prev = index == 0 ? -1 : indexArr[index-1]
                let next = index == indexArr.count - 1 ? indexArr.count : indexArr[index+1]
                
                count += (indexArr[index] - prev)*(next - indexArr[index])
            }
        }
        
        let mod = 1000000007
        
        return count%mod
    }
}

extension String {
    
    public func characterOfIndex(index: Int) -> String {
        if self.count > index {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            let endIndex = self.index(self.startIndex, offsetBy: index)
            let subString = self[startIndex...endIndex]
        
            return String(subString)
        } else {
            return self
        }
    }
    
    
    
    
}

