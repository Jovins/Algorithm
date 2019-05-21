//
//  Queue.swift
//  Swift Algorithm
//
//  Created by 黄进文 on 2019/3/21.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

// 队列是先进先出的结构，比如排队买票
// 这里只关注enqueue、dequeue、isEmpty、size、peek
protocol QueueProtocol {
    // 持有的元素类型
    associatedtype Element
    // 是否为空
    var isEmpty: Bool { get }
    // 队列的大小
    var size: Int { get }
    // 队首元素
    var peek: Element? { get }
    // 入队
    mutating func enqueue(_ newElement: Element)
    // 出队
    mutating func dequeue() -> Element?
}

struct Queue: QueueProtocol {
    
    typealias Element = Int
    private var queue = [Element]()
    private var copy = [Element]()
    
    var isEmpty: Bool {
        return queue.isEmpty && copy.isEmpty
    }
    
    var size: Int {
        return queue.count + copy.count
    }
    
    var peek: Element? {
        return copy.isEmpty ? queue.first : copy.last
    }
    
    mutating func enqueue(_ newElement: Int) {
        queue.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        
        if copy.isEmpty {
            copy = queue.reversed() // 反转
            queue.removeAll()
        }
        return copy.popLast()
    }
}

// 用栈实现队列
struct MyQueue {
    
    var stackA: Stack
    var stackB: Stack
    init() {
        stackA = Stack()
        stackB = Stack()
    }
    
    var isEmpty: Bool {
        return stackA.isEmpty && stackB.isEmpty
    }
    
    var peek: Any? {
        mutating get {
            shift()
            return stackB.peek
        }
    }
    
    var size: Int {
        return stackA.size + stackB.size
    }
    
    mutating func enqueue(object: Any) {
        stackA.push(object as! Stack.Element)
    }
    
    mutating func dequeue() -> Any {
        shift()
        return stackB.pop()!
    }
 
    mutating fileprivate func shift() {
        if stackB.isEmpty {
            while !stackA.isEmpty {
                stackB.push(stackA.pop()!)
            }
        }
    }
}
