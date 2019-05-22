//
//  UIViewController+Extension.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/16.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - LeetCode
    func leetCodeTest() {
        
        /*
         5
         3 4
         6 2 1
         4 8 2 9
         3 1 5 8 7
         2 8 4 1 6 8
         => 5 -> 3 -> 2 -> 2 -> 5 -> 1 = 18
         */
        let values: [[Int]] = [[5], [3, 4], [6, 2, 1], [4, 8, 2, 9], [3, 1, 5, 8, 7], [2, 8, 4, 1, 6, 8]]
        let triangle = Triangle()
        let sum = triangle.minimumTotal(values)
        print(sum)
        
        /// 无重复最长字符串
        let string = "abcdefarbfda"
        let length = LengthOfLongestSubstring()
        print(length.lengthOfLongestSubstring(string))
        
        // 中位数
        //        let nums1 = [-1,1,3,5,7,9]
        //        let nums2 = [2,4,6,8,10,12,14,16,20,24]
//        let nums1 = [1, 2]
//        let nums2 = [3, 4]
//        let median = MedianSortedArrays()
//        print(median.findMedianSortedArrays(nums1, nums2))
    }
    
    // MARK: - 搜索
    func searchTest() {
        
        var values: [Int] = [1, 14, 54, 12, 24, 80, 5, 33, 10, 62]
        // 升序排列
        values.sort()
        print(Search().binarySearch(values, 32))
    }
    
    // MARK: - 排序
    // Swiftu源代码中sort函数采用的是一种内省算法(introSort), 它是由堆排序、插入排序、快速排序3中算法构成
    // 依据输入的深度选择最佳的算法来完成
    func sortTest() {
        
        var values: [Int: Int] = [0: 1, 1: 14, 2: 54, 3: 12, 4: 24, 5: 80, 6: 5, 7: 33, 8: 10, 9: 62]
        // 字典键值排序
        let keys = Array(values.keys)
        let sortedKeys = keys.sorted() {
            return values[$0]! > values[$1]!
        }
        for key in sortedKeys {
            print("\(values[key]!)" + " ", terminator: "")
        }
        
        // 计数排序
        //    var values: [Int] = [1, 14, 54, 12, 24, 100, 5, 33, 10, 62, 10]
        //    let sort = Sort()
        //    sort.countSort(&values, maxValue: 100)
        //    print(values)
        
        // 冒泡排序
        //    var values: [Int] = [1, 14, 54, 12, 24, 100, 5, 33, 10, 62, 10]
        //    let sort = Sort()
        //    sort.bubleSort(&values)
        //    print(values)
        
        // 插入排序
        //    var values: [Int] = [1, 14, 54, 12, 24, 100, 5, 33, 10, 62, 10]
        //    let sort = Sort()
        //    sort.insertSort(&values)
        //    print(values)
        
        // 选择排序
        //    var values: [Int] = [1, 14, 54, 12, 24, 100, 5, 33, 10, 62, 10]
        //    let sort = Sort()
        //    sort.selectSort(&values)
        //    print(values)
        
        // 堆排序
        //    var values: [Int] = [1, 14, 54, 12, 24, 100, 5, 33, 10, 62, 10]
        //    let sort = Sort()
        //    sort.headSort(&values)
        //    print(values)
        
        // var values: [Int] = [1, 14, 54, 12, 24, 80, 5, 33, 10, 62]
        // 升序排列
        // values.sort()
        // 降序
        // print(values.sorted(by: >))
        
        // let values: [String] = ["B", "R", "Y", "B", "Y", "B", "R", "R", "Y", "Y", "R", "Y"]
        // let sort = Sort()
        // print(sort.sortToBall(values))
        // 快速排序
        // let res = sort.quickSort(values)
        // print(res)
        // 归并排序
        // let res = sort.mergeSort(array: values)
        // print(res)
    }
    
    // MARK: - 二叉树
    func treeNodeTest() {
        
        let values: [String] = ["A", "B", "D", "", "", "E", "", "", "C", "", "F", "", ""]
        let tree: Tree = Tree(values)
        let rootNode: TreeNode? = tree.createTreeNode()
        print("先序遍历")
        tree.preOrderTraverse(rootNode) // 先序遍历: A B D E C F -> A B D # # E # # C # F # #
        print("")
        print("中序遍历")
        tree.inOrderTraverse(rootNode)  // 中序遍历: D B E A C F  -> # D # B # E # A # C # F #
        print("")
        print("后序遍历")
        tree.afterOrderTraverse(rootNode) // 后序遍历: D E B F C A -> # # D # # E B # # # F C A
        print("")
        print("层次遍历")
        tree.levelOrder(rootNode)   // 层次遍历: [["A"], ["B", "C"], ["D", "E", "F"]]  -> A B C D E # F # # # # # #
        print("")
        print("栈实现遍历")
        print(tree.stackToTraversal(rootNode))
        print("App打印二叉树")
        print(tree.levelToOrder(rootNode))
        // print(tree.maxDepth(rootNode)) // 求深度
    }
    
    // reduce
    func reduceTest() {
        let numbers = [1, 2, 3, 4]
        // x: 是之前累加结果，y是b遍历数组值
        let numberSum = numbers.reduce(0, { x, y in
            x + y
        })
        print(numberSum)
    }
    
    // MARK: - 栈和队列
    // 队列: 先进先出
    func queueTest() {
        var queue = Queue()
        for i in 1..<10 {
            queue.enqueue(i)
        }
        for _ in 0..<queue.size {
            print(queue.dequeue()!)
        }
    }
    
    // 栈(Stack)是一种后入先出(Last in First Out)的数据结构，仅限定在栈顶进行插入或者删除操作。
    // 栈结构的实际应用主要有数制转换、括号匹配、表达式求值等等。
    func stackTest() {
        
        // 通过协议创建
        var stack = Stack()
        for i in 1..<10 {
            stack.push(i)
        }
        for _ in 0..<stack.size {
            print(stack.pop()!)
        }
        //    直接创建
        //    var stack = Stacks<Any>()
        //    stack.capacity = 20
        //    for i in 1..<10 {
        //        stack.push(i as Any)
        //    }
        //    for _ in 0..<stack.count {
        //        print(stack.pop() as! Int)
        //    }
    }
    
    // Facebook面试题: 给出一个文件的绝对，要求将其简化。举个例子，路径是"/home/",简化后为“/home”;路径是"/a/./b/../../c/",简化为"/c"
    // 思路的严谨，对边界条件的充分考虑，以及写代码的风格是否规范
    // let path: String = "/home/" // "/a/./b/../../c/"
    // print(simplifyPath(path: path))
    func simplifyPath(path: String) -> String {
        
        // 用数组来实现栈功能
        var pathStack = [String]()
        // 拆分原路径
        let paths = path.components(separatedBy: "/")
        for p in paths {
            // 对于"."直接跳过
            guard p != "." else {
                continue
            }
            // 对于“.."使用pop操作
            if p == ".." {
                if pathStack.count > 0 {
                    pathStack.removeLast()
                }
            } else if p != "" { // 对于数组中空字符串的特殊操作
                pathStack.append(p)
            }
        }
        // 将栈中的内容转化为优化后的新路径
        let res = pathStack.reduce("") { total, dir in "\(total)/\(dir)"}
        // 注意空路径的结果是"/"
        return res.isEmpty ? "/" : res
    }
    
    // MARK: - 链表
    func listNodeTest() {
        
        var head1: ListNode?
        var tail1: ListNode?
        var head2: ListNode?
        var tail2: ListNode?
        
        let values1 = [2, 4, 3]
        let values2 = [5, 6, 4]
        
        for i in values1 {
            appendToTail(&head1, &tail1, i)
        }
        for i in values2 {
            appendToTail(&head2, &tail2, i)
        }
        
        let sum = AddTwoNumbers()
        let outNode = sum.addTwoNumbers(head1, head2)
        traverse(outNode)
    }
    
    // 尾插法
    func appendToTail(_ head: inout ListNode?, _ tail: inout ListNode?, _ val: Int) {
        
        if tail == nil {
            tail = ListNode(val)
            head = tail
        } else {
            tail!.next = ListNode(val)
            tail = tail!.next
        }
    }
    
    // 头插法
    func appendToHead(_ head: inout ListNode?, _ val: Int) {
        if head == nil {
            head = ListNode(val)
        } else {
            let temp = ListNode(val)
            temp.next = head
            head = temp
        }
    }
    
    // 遍历链表
    func traverse(_ head: ListNode?) {
        if head == nil {
            fatalError("没有创建过链表")
        }
        var node = head
        while node != nil {
            print(node!.val)
            node = node!.next
        }
    }
    
    func listTest() {
        
        let list = List()
        for _ in 0..<10 {
            let num = Int(arc4random_uniform(UInt32(10)))
            list.appendToHead(num)
        }
        //    print("遍历链表")
        //    list.traverse()
        //    list.partition(5)
        //    print("重新遍历链表")
        //    list.traverse()
        //    print(list.hasCycle())
        
        print("遍历链表")
        list.traverse()
        list.deleteNthFromEnd(3)
        print("删除第n个后链表")
        list.traverse()
    }
    
    // MARK: - 字符串反转
    // 给出一个字符串，要求将其按照单词顺序进行反转。比如"the sky is blue" -> "blue is sky the"
    // let str = "I Love You"
    // let rts = reverseWords(str) as! String
    // print(rts)
    func reverseWords(_ str: String?) -> String? {
        guard let str = str else {
            return nil
        }
        var chars = Array(str), start = 0
        reserses(&chars, start, chars.count - 1) // 将字符串反转
        for i in 0..<chars.count {  // 将里面每个单词再反转
            if i == chars.count - 1 || chars[i + 1] == " " {
                reserses(&chars, start, i)
                start = i + 2
            }
        }
        return String(chars)
    }
    
    // 字符串反转(思想: 元组)
    // let str = "Love You Forever"
    // var chars = Array(str)
    // reserses(&chars, 0, chars.count - 1)
    func reserses<T>(_ chars: inout [T], _ start: Int,_ end: Int) {
        var start = start, end = end
        while start <= end {
            swaps(&chars, start, end)
            start += 1
            end -= 1
        }
    }
    
    func swaps<T>(_ chars: inout [T], _ s: Int, _ e: Int) {
        (chars[s], chars[e]) = (chars[e], chars[s])
    }
    
    // 检测字符串是否由数字组成
    func isStrNum(_ str: String) -> Bool {
        return Int(str) != nil
    }
    
    // 访问字符串中单个单词
    func getChar() {
        let str = "ajdsdfsd"
        let char = str[str.index(str.startIndex, offsetBy: 3)]
        print(char)
    }
    
    // MARK: - 求和
    // 给定一个整型数组中有且只有两个数之和等于目标值，求这两个数在数组中的序号
    // let nums: [Int] = [2, 5, 8, 3, 14]
    // print(twoSum2(nums, 16))
    func twoSum2(_ nums:[Int], _ target: Int) -> [Int] {
        var dic = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let index = dic[target - num] {
                return [index, i]
            } else {
                dic[num] = i
            }
        }
        fatalError("不存在")
    }
    
    // 给出一个数组和一个目标值， 判断数组中是否有两个数之和等于目标值,时间复杂度 O(n)
    // let nums: [Int] = [1, 2, 3, 4, 5]
    // print(twoSum(nums, 2))
    func twoSum(_ nums:[Int], _ target: Int) -> Bool {
        var set = Set<Int>()
        for num in nums {
            if set.contains(target - num) {
                return true
            }
            set.insert(num)
        }
        return false
    }
    
    // MARK: - 集合
    func setTest() {
        
        let primeNums: Set = [3, 5, 7, 11, 13]
        let oddNums: Set = [1, 3, 5, 7, 9]
        
        // 交集、并集、差集
        let primeAndOddNum = primeNums.intersection(oddNums)
        print(primeAndOddNum)
        let primeOrOddNum = primeNums.union(oddNums)
        print(primeOrOddNum)
        let primeNotOddNum = primeNums.subtracting(oddNums)
        print(primeNotOddNum)
    }

}
