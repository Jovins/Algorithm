//
//  Sort.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/3/22.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

/*
 名称             时间复杂度           空间复杂度           是否稳定
 
 冒泡排序          O(n^2)             O(1)               是
 插入排序          O(n^2)             O(1)               是
 归并排序          O(nlogn)           O(1)               是
 选择排序          O(n^2)             O(1)               否
 快速排序          O(nlogn)           O(1)               否
 堆排序            O(nlogn)           O(1)               否
 桶排序            O(n)               O(k)               是
 */

public class Sort {
    
    // 希尔排序
    func shellSort(_ array: inout Array<NSInteger>) {
        
        var gap = array.count / 2
        repeat {
            
            // 1.从第一个元素开始依次取出所有用于比较元素
            for i in gap..<array.count {
                
                // 2.遍历取出前面元素进行比较
                var j = i
                while j - gap >= 0 {
                    
                    if array[j - gap] > array[j] {
                        swaps(&array, j - gap, j)
                    } else {
                        break
                    }
                    j -= 1
                }
            }
            // 每个小数组排序完成, 重新计算步长
            gap = gap / 2
        } while gap >= 1
    }
    
    // 堆排序
    var len: Int = 0
    func headSort(_ array: inout Array<NSInteger>) {
        
        // 构建大顶堆
        for i in (0...(array.count / 2 - 1)).reversed() {
            adjustHead(&array, i, array.count)
        }
        // 调整堆结构+交换堆顶元素与末尾元素
        for j in (1...(array.count - 1)).reversed() {
            swaps(&array, 0, j)                             // 将堆顶元素与末尾元素进行交换
            adjustHead(&array, 0, j)                        // 重新对堆进行调整
        }
    }
    
    // 调整大顶堆（仅是调整过程，建立在大顶堆已构建的基础上）
    func adjustHead(_ array: inout Array<NSInteger>, _ index: Int, _ len: Int) {
        
        var index = index
        let temp = array[index] // 取出当前元素
        var k = 2 * index + 1
        while k < len {                                     // 从i结点的左子结点开始，也就是2i+1处开始
            if k + 1 < len && array[k] < array[k + 1] {     // 如果左子结点小于右子结点，k指向右子结点
                k += 1
            }
            if array[k] > temp {                            // 如果子节点大于父节点，将子节点值赋给父节点（不用进行交换）
                
                array[index] = array[k]
                index = k
            } else {
                break
            }
            k = k * 2 + 1
        }
        array[index] = temp                                 // 将temp值放到最终的位置
    }
    
    // 交换两个数
    func swaps<T>(_ chars: inout [T], _ s: Int, _ e: Int) {
        (chars[s], chars[e]) = (chars[e], chars[s])
    }
    
    // 选择排序
    // array: 待排序数组
    // 降序
    func selectSort(_ array: inout [NSInteger]) {
        
        for i in 0..<array.count {
            
            for j in i..<array.count - 1 {
                
                if array[i] < array[j + 1] {
                    
                    swaps(&array, i, j + 1)
                }
            }
        }
    }
    
    // 插入排序
    // array: 待排序数组
    // 升序
    func insertSort(_ array: inout [NSInteger]) {
        
        for i in 1..<array.count {
            for j in 0..<i {
                let k = i - j
                if array[k - 1] > array[k] {
                    swaps(&array, k - 1, k)
                } else {
                    break
                }
            }
        }
    }
    
    // 冒泡排序
    // array: 待排序数组
    // 降序
    func bubleSort(_ array: inout [NSInteger]) {
        
        for i in 0..<array.count {
            for j in 0..<array.count - i - 1 {
                
                if array[j] < array[j + 1] {
                    swaps(&array, j, j + 1)
                }
            }
        }
    }
    
    
    
    // 计数排序
    // array: 待排序数组
    // maxValue: 数组中最大值
    func countSort(_ array: inout [NSInteger], maxValue: NSInteger) {
        
        var nums = [NSInteger](repeating: 0, count: maxValue + 1)
        // 遍历带排序的数组
        for i in 0..<array.count {
            // 取出带排序的数组当前值
            let value = array[i]
            // 将待排序数组当前值作为排序数组索引
            // 将用于排序数组对应索引原有值+1，主要目的->考虑数组中有重复数字
            nums[value] += 1
        }
        
        // 还原排序结果到待排序数组
        var index = 0
        for i in 0..<nums.count {
            for _ in 0..<nums[i] {
                array[index] = i
                index += 1
            }
        }
    }
    
    // 有三种颜色（红，黄，蓝）的球若干，要求将所有红色的球放在黄色球的前面，最后放上所有的蓝色球。
    func sortToBall(_ values: [String]) -> [String] {
        
        let values = values
        var red = 0, yel = 0, blu = 0
        // 计算每种球的个数
        for value in values {
            if value == "R" {
                red += 1
            } else if value == "Y" {
                yel += 1
            } else {
                blu += 1
            }
        }
        // 放置球
        var res = Array(repeating: "", count: values.count)
        var r = 0, y = red, b = red + yel
        for (_, value) in values.enumerated() {
            if value == "R" && r < red  {
                res[r] = value
                r += 1
            } else if value == "Y" && y < b {
                res[y] = value
                y += 1
            } else if value == "B" && b < values.count {
                res[b] = value
                b += 1
            }
        }
        
        return res
    }
    
    // 快速排序
    func quickSort(_ array: [Int]) -> [Int] {
        
        guard array.count > 1 else {
            return array
        }
        let privot = array[array.count / 2]
        let left = array.filter { $0 < privot }
        let middle = array.filter { $0 == privot }
        let right = array.filter { $0 > privot }
        return quickSort(left) + middle + quickSort(right)
    }
    
    // 归并排序(https://www.cnblogs.com/chengxiao/p/6194356.html)
    // 归并排序（MERGE-SORT）是利用归并的思想实现的排序方法，该算法采用经典的分治（divide-and-conquer）策略（
    // 分治法将问题分(divide)成一些小的问题然后递归求解，而治(conquer)的阶段则将分的阶段得到的各答案"修补"在一起，即分而治之)。
    func mergeSort(array: [Int]) -> [Int] {
        var helper = Array(repeating: 0, count: array.count)
        var array = array
        mergeSort(&array, &helper, 0, array.count - 1)
        return array
    }
    
    func mergeSort(_ array: inout [Int], _ helper: inout [Int], _ low: Int, _ high: Int) {
        guard low < high else {
            return
        }
        
        let middle = (high - low) / 2 + low
        mergeSort(&array, &helper, low, middle)
        mergeSort(&array, &helper, middle + 1, high)
        merge(&array, &helper, low, middle, high)
    }
    
    func merge(_ array: inout [Int], _ helper: inout [Int], _ low: Int, _ middle: Int, _ high: Int) {
        // copy both halves into a helper array
        for i in low ... high {
            helper[i] = array[i]
        }
        
        var helperLeft = low
        var helperRight = middle + 1
        var current = low
        
        // iterate through helper array and copy the right one to original array
        while helperLeft <= middle && helperRight <= high {
            if helper[helperLeft] <= helper[helperRight] {
                array[current] = helper[helperLeft]
                helperLeft += 1
            } else {
                array[current] = helper[helperRight]
                helperRight += 1
            }
            current += 1
        }
        
        // handle the rest
        guard middle - helperLeft >= 0 else {
            return
        }
        for i in 0 ... middle - helperLeft {
            array[current + i] = helper[helperLeft + i]
        }
    }
}
