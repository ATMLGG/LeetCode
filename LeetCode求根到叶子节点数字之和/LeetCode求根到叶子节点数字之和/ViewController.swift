//
//  ViewController.swift
//  LeetCode求根到叶子节点数字之和
//
//  Created by young.yang on 2020/9/21.
//

import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let node1 = TreeNode.init(9)
        node1.left = TreeNode.init(5)
        node1.right = TreeNode.init(1)
        
        let node = TreeNode.init(4)
        node.left = node1
        node.right = TreeNode.init(0)
        
        NSLog("\(sumNumbers(node))")
        
    }

    func sumNumbers(_ root: TreeNode?) -> Int {
        
        return sumSubNode(root, 0)
    }
    
    func sumSubNode(_ root: TreeNode?, _ sum:Int) -> Int {
        
        if root == nil {
            return 0
        }
        
        var tmpSum = 0
        
        tmpSum = (sum * 10 + root!.val)
        
        if root?.left == nil && root?.right == nil {
            return tmpSum
        }
        
        return sumSubNode(root?.left, tmpSum) + sumSubNode(root?.right, tmpSum);
    }

}

