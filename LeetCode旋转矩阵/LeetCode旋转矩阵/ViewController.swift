//
//  ViewController.swift
//  LeetCode旋转矩阵
//
//  Created by young.yang on 2020/11/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var matrix = [
            [1,2,3],
            [4,5,6],
            [7,8,9]
          ]
        
        self.rotate(&matrix)
    }

//    点(x1,y1)绕点(x2,y2)旋转a度,得到点(x,y)
//    经过计算后可得
//    x == x2 + (x1 - x2)*cos(a) - (y1 - y2)*sin(a)
//    y == y2 + (y1 - y2)*cos(a) + (x1 - x2)*sin(a)
//
//    带入绕点(0,0)旋转-90度并平移至正常坐标系(y轴正向平移N-1)
//    得:
//    x = y1
//    y = -x1 + (N - 1)
    
    func rotate(_ matrix: inout [[Int]]) {
        
        let N = matrix.count
        var tmpMatrix = matrix
        
        for i in 0..<matrix.count {
            
            for j in 0..<matrix[i].count {
                
                tmpMatrix[j][-i + N - 1] = matrix[i][j]
            }
        }
        
        matrix = tmpMatrix
    }

}

