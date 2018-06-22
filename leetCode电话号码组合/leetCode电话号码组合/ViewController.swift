//
//  ViewController.swift
//  leetCode电话号码组合
//
//  Created by yyj on 2018/6/12.
//  Copyright © 2018年 yyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
}

class Solution {
    
    let staticDic = [
        "2":"abc",
        "3":"def",
        "4":"ghi",
        "5":"jkl",
        "6":"mno",
        "7":"pqrs",
        "8":"tuv",
        "9":"wxyz",
        ]
    
    func letterCombinations(_ digits: String) -> [String] {
        
        if (digits == "") {
            return []
        }
        
        var digitsArray:Array = Array<String>()
        for char in digits {
            digitsArray.append(String.init(char))
        }
        
        var stringArray = Array<String>()
        combinateString(digitsArray, &stringArray, "", 0)
        return stringArray
    }
    
    func combinateString(_ digitsArray: [String], _ stringArray: inout Array<String>, _ currentStr: String, _ index:Int) {
        
        if digitsArray.count == index {
            if currentStr.count != 0 {
                stringArray.append(currentStr)
            }
            
            return
        }
        
        for letter in staticDic[digitsArray[index]] ?? "" {
            
            let next = currentStr + String.init(letter)
            
            combinateString(digitsArray, &stringArray, next, index+1)
        }
    }
}

