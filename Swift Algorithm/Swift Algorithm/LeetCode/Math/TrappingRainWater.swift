//
//  TrappingRainWater.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/23.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class TrappingRainWater {
    
    func trap(_ height: [Int]) -> Int {
        
        guard height.count > 1 else {
            return 0
        }
        var left = 0, right = height.count - 1, res = 0
        var left_max = 0, right_max = 0
        while left < right {
            
            if height[left] < height[right] {
                
                height[left] >= left_max ? (left_max = height[left]) : (res += left_max - height[left])
                left += 1
            } else {
                
                height[right] >= right_max ? (right_max = height[right]) : (res += right_max - height[right])
                right -= 1
            }
        }
        return res
    }
    
    func trap3(_ height: [Int]) -> Int {
        
        guard height.count > 1 else {
            return 0
        }
        var res = 0
        var cur = 0
        var stack = [Int]()
        while cur < height.count {
            
            // 非空肯定有值
            while !stack.isEmpty && height[cur] > height[stack.last!] {
                
                let top = stack.last!   // 记录top索引
                let _ = stack.popLast() // 栈顶出栈
                if stack.isEmpty {
                    break
                }
                let distance = cur - stack.last! - 1
                let bound_height = min(height[cur], height[stack.last!]) - height[top]
                res += distance * bound_height
            }
            stack.append(cur)
            cur += 1
        }
        return res
    }
    
    func trap2(_ height: [Int]) -> Int {
        
        guard height.count > 1 else {
            return 0
        }
        let count = height.count
        var res = 0
        var lefts: [Int] = Array(repeating: 0, count: count)
        var rights: [Int] = Array(repeating: 0, count: count)
        lefts[0] = height[0]
        for i in 1..<count {
            
            lefts[i] = max(height[i], lefts[i - 1])
        }
        rights[count - 1] = height[count - 1]
        for j in (0...count - 2).reversed() {
            rights[j] = max(height[j], rights[j + 1])
        }
        for k in 1..<count - 1 {
            res += min(lefts[k], rights[k]) - height[k]
        }
        return res
    }
    
    // 时间复杂度为O(n^2)会超出时间限制，不可取
    func trap1(_ height: [Int]) -> Int {
        
        guard height.count > 1 else {
            return 0
        }
        
        var res = 0
        for i in 1..<height.count - 1 {
            
            var max_left = 0
            var max_right = 0
            for j in (0...i).reversed() {
                max_left = max(max_left, height[j])
            }
            for k in i..<height.count {
                max_right = max(max_right, height[k])
            }
            res += min(max_left, max_right) - height[i]
        }
        return res
    }
}
