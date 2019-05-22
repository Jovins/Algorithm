//
//  RemoveNthFromEnd.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/22.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class RemoveNthFromEnd {
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        let dummy = ListNode(0)
        dummy.next = head
        var pre: ListNode? = dummy
        var pos: ListNode? = dummy
        // 移动pos, 直到pos与pre之间相隔的元素个数为n
        for _ in 0..<n {
            pos = pos!.next
        }
        // 同时移动pos和pre
        while pos!.next != nil {
            
            pre = pre!.next
            pos = pos!.next
        }
        pre!.next = pre!.next!.next
        return dummy.next
    }
}
