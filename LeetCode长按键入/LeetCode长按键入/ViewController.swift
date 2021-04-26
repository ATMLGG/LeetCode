//
//  ViewController.swift
//  LeetCode长按键入
//
//  Created by young.yang on 2021/4/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NSLog("\(isLongPressedName("vtkgn", "vttkgnn"))")
    }


    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        
        if typed.count < name.count {
            return false
        }
        
        var i = 0
        
        let nameArray = Array(name)
        let typedArray = Array(typed)
        
        for typedIndex in 0..<typedArray.count {
            
            if i < nameArray.count && nameArray[i] == typedArray[typedIndex] {
                
                i += 1
            } else if typedIndex > 0 && typedArray[typedIndex] == typedArray[typedIndex - 1] {
                
                continue
            } else {
                
                return false
            }
        }
        
        return i == name.count
    }
}

