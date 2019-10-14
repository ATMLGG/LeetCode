//
//  ViewController.swift
//  LeetCode生命游戏
//
//  Created by 杨赟鋆 on 2019/10/12.
//  Copyright © 2019 webeye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var test = [
          [0,1,0],
          [0,0,1],
          [1,1,1],
          [0,0,0]
        ]
        
        gameOfLife(&test)
        print(test)
    }

    enum Status: Int {
        case StillAlive = 1
        case StillDead
        case BecomeAlive
        case BecomeDead
    }
    
    func gameOfLife(_ board: inout [[Int]]) {
        
        for i in 0..<board.count {
            
            for j in 0..<board[i].count {
                
                board[i][j] = checkStatus(board, i, j)
            }
        }
        
        for i in 0..<board.count {
            
            for j in 0..<board[i].count {
                
                if board[i][j] == Status.StillAlive.rawValue || board[i][j] == Status.BecomeAlive.rawValue {
                    board[i][j] = 1
                } else {
                    board[i][j] = 0
                }
            }
        }
    }
    
    func checkStatus(_ board: [[Int]], _ i: Int, _ j: Int) -> Int {

        var count = 0
        let top = max(0, i - 1)
        let bottom = min(board.count - 1, i + 1)
        let left = max(0, j - 1)
        let right = min(board[i].count - 1, j + 1)
        
        for v in top...bottom {
            
            for h in left...right {
                
                count = board[v][h] == Status.StillAlive.rawValue || board[v][h] == Status.BecomeDead.rawValue ? count + 1 : count
            }
        }
        
        return board[i][j] == Status.StillAlive.rawValue ? ((count < 3 || count > 4) ? Status.BecomeDead.rawValue : Status.StillAlive.rawValue) : ((count == 3) ? Status.BecomeAlive.rawValue : Status.StillDead.rawValue)
    }

}

