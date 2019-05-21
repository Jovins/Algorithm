//
//  Stack.swift
//  Swift Algorithm
//
//  Created by 黄进文 on 2019/3/20.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

// 栈是后进先出的结构，好比如叠盘子。
protocol StackProtocol {
    // 持有的元素类型
    associatedtype Element
    // 是否为空
    var isEmpty: Bool { get }
    // 栈的大小
    var size: Int { get }
    // 栈顶元素
    var peek: Element? { get }
    // 进栈
    mutating func push(_ newElement: Element)
    // 出栈
    mutating func pop() -> Element?
}

struct Stack: StackProtocol {
    
    private var stack = [Element]()
    typealias Element = Int
    var isEmpty: Bool { return stack.isEmpty }
    var size: Int { return stack.count }
    var peek: Element? { return stack.last }
    
    mutating func push(_ newElement: Element) {
        stack.append(newElement)
    }
    
    mutating func pop() -> Element? {
        return stack.popLast()
    }
}

// MARK: 队列实现栈
struct MyStack {
    var queueA: Queue
    var queueB: Queue
    init() {
        queueA = Queue()
        queueB = Queue()
    }
    
    var isEmpty: Bool {
        return queueA.isEmpty && queueB.isEmpty
    }
    
    var peek: Any? {
        
        mutating get {
            shift()
            let peekObj = queueA.peek
            queueB.enqueue(queueA.dequeue()!)
            swap()
            return peekObj
        }
    }
    
    var size: Int {
        return queueA.size
    }
    
    mutating func push(object: Any) {
        queueA.enqueue(object as! Int)
    }
    
    mutating func pop() -> Any? {
        shift()
        let popObj = queueA.dequeue()
        swap()
        return popObj
    }
    
    mutating private func shift() {
        while queueA.size != 1 {
            queueB.enqueue(queueA.dequeue()!)
        }
    }
    
    mutating private func swap() {
        (queueA, queueB) = (queueB, queueA)
    }
}


// MARK: 另一种
struct Stacks<T> {
    
    // 声明一个泛型数组，用于储存栈中的元素
    private var elements = [T]()
    
    // 返回栈结构中元素的个数
    public var count: Int {
        return elements.count
    }
    
    // 获取或者设置栈的存储容量
    public var capacity: Int {
        get {
            return elements.capacity
        }
        set {
            elements.reserveCapacity(newValue) // 用于为原数组预留空间，防止数组在增加或者删除元素时反复申请内存空间或者创建新的数组
        }
    }
    
    // 初始化
    public init(){}
    
    // 使用push方法执行入栈操作
    public mutating func push(_ element: T) {
        // 判断是否已经满
        if count == capacity {
            fatalError("栈已满，不能再执行入栈")
        }
        self.elements.append(element)
    }
    
    // 使用pop方法执行出栈操作
    @discardableResult
    public mutating func pop() -> T? {
        // 是否为空
        if count == 0 {
            fatalError("栈已经空，不能再执行出栈操作")
        }
        return elements.popLast() // 返回并且删除最后一个元素
    }
    
    // 返回栈顶元素
    public func peek() -> T? {
        return elements.last
    }
    
    // 清空所有元素
    public mutating func clearAll() {
        elements.removeAll()
    }
    
    // 判断是否为空
    public mutating func isEmpty() -> Bool {
        return elements.isEmpty
    }
    
    // 判断栈是否满了
    public mutating func isFull() -> Bool {
        if count == 0 {
            return false
        } else {
            return count == elements.capacity
        }
    }
}
