//
//  ViewController.swift
//  LeetCode分隔链表
//
//  Created by 杨赟鋆 on 2018/9/3.
//  Copyright © 2018年 杨赟鋆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let node1 = ListNode(1)
        let node2 = ListNode(4)
        let node3 = ListNode(3)
        let node4 = ListNode(2)
        let node5 = ListNode(5)
        let node6 = ListNode(2)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        
        
        partition(node1, 3)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        
        let node1 = ListNode.init(0)
        let node2 = ListNode.init(0)
        
        var list1: ListNode? = node1
        var list2: ListNode? = node2
        
        var head = head
        
        while head != nil {
            
            if head!.val < x {
                
                list1?.next = head
                list1 = head
            } else {
                
                list2?.next = head
                list2 = head
            }
            
            head = head?.next
            
        }
        
        list2?.next = nil
        list1?.next = node2.next
        
        return node1.next
    }
}

