//
//  Search.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/3/22.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

public class Search {
    
    /*
     深度优先搜索(DFS)和广度优先搜索(BFS): DFS的实现用递归，BFS的实现用循环（配合队列）。
                                      1
                            2       5       6       9
                          3   4             7       10
                                            8
     
     DFS的搜索步骤为
     
     1
     2 -> 3 -> 4
     5
     6 ->7 -> 8
     9 -> 10
     
     即每次把一个方向彻底搜索完全后，才返回搜索下一个方向。
     BFS的搜索步骤为
     
     1
     2 -> 5 -> 6 -> 9
     3 -> 4
     7
     10
     8
     
     即每次访问上一步周围所有方向上的角落。
     细心的朋友会记得，我之前在讲二叉树的时候，讲到了前序遍历和层级遍历，而这两者本质上就是DFS和BFS。
     */
    // 深度优先搜索(相当前序遍历)
    func dfs(_ root: TreeNode?) {
        guard let root = root else {
            print("", terminator: "")
            return
        }
        print("\(root.val) ", terminator: "")
        dfs(root.left)
        dfs(root.right)
    }
    
    // 广度优先搜索(相当层次遍历)
    func bfs(_ root: TreeNode?) {
        var result = [[TreeNode]]()
        var level = [TreeNode]()
        if let root = root {
            level.append(root)
        }
        while !level.isEmpty {
            result.append(level)
            var nextLevel = [TreeNode]()
            for node in level {
                if let leftNode = node.left {
                    nextLevel.append(leftNode)
                }
                if let rightNode = node.right {
                    nextLevel.append(rightNode)
                }
            }
            level = nextLevel
        }
        
        let res = result.map { $0.map { $0.val }}
        print("\(res) ", terminator: "")
    }
    
    // 二分查找
    /*
     1. mid被定义在while循环外面，如果被定义在里面，则每次循环都要重新给mid分配内存空间，从而会造成不必要的浪费；
        定义再循环之外，则每次循环只是重新赋值。
     2. 每次重新给mid赋值不能写成mid = (right + left) / 2。这种写法表面上看没有问题，但当数组非常长、算法又
        已经搜索到了最右边部分时，right + left就会非常大，造成溢出，导致程序崩溃，所以，解决问题的办法是写成mid = (right - left) / 2 + left
     */
    func binarySearchs(_ values: [Int], _ target: Int) -> Bool {
        
        var left = 0, mid = 0, right = values.count - 1
        while left <= right {
            mid = (right - left) / 2 + left
            if values[mid] == target {
                return true
            } else if values[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return false
    }
    
    // 递归实现二分法
    func binarySearch(_ values: [Int], _ target: Int) -> Bool {
        
        return binarySearch(values, target, left: 0, right: values.count - 1)
    }
    
    func binarySearch(_ values: [Int], _ target: Int, left: Int, right: Int) -> Bool {
        
        guard left <= right else {
            return false
        }
        let mid = (right - left) / 2 + left
        if values[mid] == target {
            return true
        } else if values[mid] < target {
            return binarySearch(values, target, left: mid + 1, right: right)
        } else {
            return binarySearch(values, target, left: left, right: mid - 1)
        }
    }
    
    /*
     有一个产品发布了n个版本。它遵循以下规律：假如某个版本崩溃了，后面的所有版本都会崩溃。
     举个例子：一个产品假如有5个版本，1，2，3版都是好的，但是第4版崩溃了，那么第5个版本（最新版本）一定也崩溃。第4版则被称为第一个崩溃的版本。
     现在已知一个产品有n个版本，而且有一个检测算法 func isBadVersion(version: Int) -> Bool 可以判断一个版本是否崩溃。假设这个产品的最新版本崩溃了，求第一个崩溃的版本。
     分析:
        分析这种题目，同样还是先抽象化。我们可以认为所有版本为一个数组[1, 2, 3, ..., n]，现在我们就是要在这个数组中检测出满足 isBadVersion(version) == true中version的最小值。
     注意点:
        当发现中间版本(mid)是崩溃版本的时候，只能说明第一个崩溃的版本小于等于中间版本。所以只能写成 right = mid
        当检测到剩下一个版本的时候，我们已经无需在检测直接返回即可，因为它肯定是崩溃的版本。所以while循环不用写成left <= right
     */
    func findFirstBadVersion(_ version: Int) -> Int {
        
        // 处理特殊情况
        guard version >= 1 else {
            return -1
        }
        var left = 1, right = version, mid = 0
        while left < right {
            
            mid = (right - left) / 2 + left
            if isBadVersion(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return right
    }
    
    func isBadVersion(_ version: Int) -> Bool {
    
        return version == 8 ? true : false
    }
    
    /*
     一个有序数组可能在某个位置被旋转。给定一个目标值，查找并返回这个元素在数组中的位置，如果不存在，返回-1。假设数组中没有重复值。
     举个例子：[0, 1, 2, 4, 5, 6, 7]在4这个数字位置上被旋转后变为[4, 5, 6, 7, 0, 1, 2]。搜索4返回0。搜索8则返回-1。
     */
    func search(nums: [Int], target: Int) -> Int {
        var (left, mid, right) = (0, 0, nums.count - 1)
        while left <= right {
            mid = (right - left) / 2 + left
            if nums[mid] == target {
                return 1
            }
            if nums[mid] >= nums[left] {
                if nums[mid] > target && target >= nums[left] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                if nums[mid] < target && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return -1
    }
}
