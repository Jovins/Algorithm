//
//  SearchInsert.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/24.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class SearchInsert { 
    
    // 二分查找
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
     
        var pre = 0, mid = 0, las = nums.count
        while pre < las {
            
            mid = pre + (las - pre) / 2
            if nums[mid] < target {
                
                pre = mid + 1
            } else {
                las = mid
            }
        }
       return pre
    }
    
    // 循环搜索
    func searchInsert1(_ nums: [Int], _ target: Int) -> Int {
        
        guard nums.count > 0 else {
            return 0
        }
        for i in 0..<nums.count {
            
            if nums[i] >= target {
                return i
            }
        }
        return nums.count
    }
}
