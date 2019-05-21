//
//  MergeTwoSortedLists.swift
//  Swift Algorithm
//
//  Created by 黄进文 on 2019/5/17.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class MergeTwoSortedLists {
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        let dummy = ListNode(0)
        var node = dummy // node移动节点
        
        var l1 = l1
        var l2 = l2
        
        while l1 != nil && l2 != nil {
            
            if l1!.val < l2!.val {
                
                node.next = l1
                l1 = l1!.next
            } else {
                
                node.next = l2
                l2 = l2!.next
            }
            node = node.next!
        }
        node.next = l1 ?? l2 // 假如一个链表遍历空了，直接拼接另一个链表
        return dummy.next
    }
}
