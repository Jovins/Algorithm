//
//  AddTwoNumbers.swift
//  Swift Algorithm
//
//  Created by 黄进文 on 2019/5/16.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

public class ListNode {
    
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        
        self.val = val
        self.next = nil
    }
}

class AddTwoNumbers {
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        guard let l1 = l1 else {
            return l2
        }
        guard let l2 = l2  else {
            return l1
        }
        let outputNode = ListNode((l1.val + l2.val) % 10)
        // 加入l1.val + l2.val > 10, 把溢出的1带到下一个节点
        if l1.val + l2.val > 9 {
            
            outputNode.next = addTwoNumbers(addTwoNumbers(l1.next, l2.next), ListNode(1))
        } else {
            outputNode.next = addTwoNumbers(l1.next, l2.next)
        }
        return outputNode
    }
}
