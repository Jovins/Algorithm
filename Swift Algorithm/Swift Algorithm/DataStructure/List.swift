//
//  List.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/3/20.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

// 节点
class Node {
    
    var val: Int
    var next: Node?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// 链表
// 头插法: 1.让新节点的下一个节点等于头节点的下一个节点。2.让头节点的下一个节点等于新节点。规律新的节点永远都是插入到头结点后面
// 尾插法: 1.定义变量记录新节点的上一个节点。2.将新节点添加到上一个节点的后面。3.让新节点成为下一个节点的上一个节点。规律: 新节点永远添加到最后面
// 注意点: 1. 一定要注意头节点可能就是nil,所以给定链表后，要看清楚head是不是optional,然后判定是不是要处理这种边界条件
//        2. 注意每个节点的next可能是nil。如果不为nil，则用“!”修饰变量。在赋值的时候也要注意"!"，将optionald节点传给废optional节点的情况
class List {
    
    var head: Node?
    var tail: Node?
    
    // 尾插法
    func appendToTail(_ val: Int) {
        if tail == nil {
            tail = Node(val)
            head = tail
        } else {
            tail!.next = Node(val)
            tail = tail!.next
        }
    }
    
    // 头插法
    func appendToHead(_ val: Int) {
        if head == nil {
            head = Node(val)
            tail = head
        } else {
            let temp = Node(val)
            temp.next = head
            head = temp
        }
    }
    
    // 遍历链表
    func traverse() {
        if head == nil {
            fatalError("没有创建过链表")
        }
        var node = head
        while node != nil {
            print(node!.val)
            node = node!.next
        }
    }
    
    // 给出一个链表和一个值x,要求将链表中所有小于x的值放到左边，所有大于或者等于x的值放到右边
    // 并且原链表的节点顺序不变。如: 1->5->3->2->4->2，给定x=3;则返回1->2->2->5->3->4
    func partition(_ x: Int) {
        // 引入dummy节点
        var pre = Node(0), post = Node(0)
        let preV = pre, postV = post
        var node = head
        
        // 用尾插法处理左边和右边
        while node != nil { // 遍历
            if node!.val < x {
                pre.next = node
                pre = node!
            } else {
                post.next = node
                post = node!
            }
            node = node!.next
        }
        // 防止构成环
        post.next = nil
        // 左右拼接
        pre.next = postV.next
        head = preV.next
    }
    
    // 快行指针
    // 如何检测一个链表中是否有环？
    // 用两个指针同时访问链表，其中一个的速度是另一个的两倍，如果他们变成相等的了，那么这个链表就有环了
    func hasCycle() -> Bool {
        var slow = head
        var fast = head
        while fast != nil && fast!.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
            if slow === fast {
                return true
            }
        }
        return false
    }
    
    // 删除链表中倒数第n个节点。如：1->5->3->2->4->2, n = 2 返回 1->5->3->2->2
    // 思路依然是快行指针，这次两个指针的移动速度相同。但是一开始，第一个指针(在指向头结点之前)就落后第二个指针n个节点。
    // 接着两者同时移动，当第二个节点指针移动到尾节点是，第一个节点的下一个节点就是我们要删除的节点
    func deleteNthFromEnd(_ n: Int) {
        
        let dummy = Node(0)
        dummy.next = head
        
        var pre: Node? = dummy
        var post: Node? = dummy
        // 一开始post就落后n位
        for _ in 0..<n {
            if post == nil {
                break
            }
            post = post!.next
        }
        // 同时移动两个指针
        while post != nil && post!.next != nil {
            pre = pre!.next
            post = post!.next
        }
        // 删除节点
        pre!.next = pre!.next!.next
        head = dummy.next
    }
}
