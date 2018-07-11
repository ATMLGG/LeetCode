//
//  ViewController.swift
//  LeetCode打家劫舍3
//
//  Created by 杨赟鋆 on 2018/7/10.
//  Copyright © 2018年 杨赟鋆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //这道题想了很久,因为是和前两道提一起做的,思维被局限了,其实还是可以用动态规划来思考问题
    //num[n] = max(dp(n-2)+dp(n), dp(n-1))
    //dp(n)是由下往上的可抢最大值,隔行可抢
    
    func rob(_ root: TreeNode?) -> Int {
        
        var l = 0
        var r = 0
        
        return countNum(root, &l, &r)
        
    }
    
    func countNum(_ root: TreeNode?, _ l: inout Int, _ r: inout Int) -> Int {
        
        if (root == nil) {
            return 0
        }
        
        var ll = 0
        var lr = 0
        var rl = 0
        var rr = 0
        
        l = countNum(root?.left, &ll, &lr)
        r = countNum(root?.right, &rl, &rr)
        
        return max((root?.val)!+ll+lr+rl+rr, l+r)
    
    }
    


}

