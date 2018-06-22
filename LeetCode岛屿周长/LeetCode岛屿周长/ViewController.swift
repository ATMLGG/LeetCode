//
//  ViewController.swift
//  LeetCode岛屿周长
//
//  Created by 杨赟鋆 on 2018/6/13.
//  Copyright © 2018年 杨赟鋆. All rights reserved.
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

    func islandPerimeter(_ grid: [[Int]]) -> Int {
        
        var length = 0;
        
        if grid.count == 0 || grid[0].count == 0 {
            return 0
        }
        
        for i in 0...grid.count - 1 {
            for j in 0...grid[0].count - 1 {
                
                if grid[i][j] == 1 {
                    length += 4
                    
                    if i > 0 && grid[i - 1][j] == 1 {
                        length -= 2
                    }
                    
                    if j > 0 && grid[i][j - 1] == 1 {
                        length -= 2
                    }
                }
            }
        }
        
        return length
    }
}

