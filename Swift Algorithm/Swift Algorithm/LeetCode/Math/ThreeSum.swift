//
//  ThreeSum.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/17.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class ThreeSum {
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        var nums = nums.sorted(by: <)   // 先排序数组
        var result = [[Int]]()
        
        if nums.count <= 2 {
            return result
        }
        for i in 0...nums.count - 3 {
            
            if i == 0 || nums[i] != nums[i - 1] {
                
                let remain = -nums[i]   // 找出两个数判断是否跟remain相等，如果相等那么两个数跟nums[i]和为0
                var left = i + 1
                var right = nums.count - 1
                while left < right {
                    
                    if nums[left] + nums[right] == remain {
                        
                        var temp = [Int]()
                        temp.append(nums[i])
                        temp.append(nums[left])
                        temp.append(nums[right])
                        result.append(temp)
                        
                        repeat {
                            left += 1
                        } while (left < right && nums[left] == nums[left - 1]) // 排除此时left重复的值
                        repeat {
                            right -= 1
                        } while (left < right && nums[right] == nums[right + 1])    // 排除right重复的值
                    } else if nums[left] + nums[right] < remain {   // 左边数值小，需要left向右移动
                        
                        repeat {
                            left += 1
                        } while (left < right && nums[left] == nums[left - 1])
                    } else {
                        
                        repeat {
                            right -= 1
                        } while (left < right && nums[right] == nums[right + 1])
                    }
                }
            }
        }
        
        return result
    }
}
