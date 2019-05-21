//
//  SwapNodesInPairs.swift
//  Swift Algorithm
//
//  Created by 黄进文 on 2019/5/16.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class SwapNodesInPairs {
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        let dummyHead = ListNode(0)
        dummyHead.next = head
        
        var preNode: ListNode? = dummyHead
        var curNode = dummyHead.next
        
        while curNode != nil && curNode!.next != nil {
            
            let next = curNode!.next
            let post = curNode!.next!.next
            
            preNode!.next = next
            next!.next = curNode
            curNode!.next = post
            
            preNode = curNode
            curNode = post
        }
        
        return dummyHead.next
    }
}
