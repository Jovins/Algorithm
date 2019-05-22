//
//  MissingNumber.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/17.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class MissingNumber {
    
    func missingNumber(_ nums: [Int]) -> Int {
        
        let res = nums.sorted(by: <)
        var left = 0
        var right = res.count
        while left < right {
            
            let mid = (left + right) / 2
            if mid < res[mid] {
                
                right = mid
            } else {
                
                left = mid + 1
            }
        }
        return left
    }
    
    func missingNumber2(_ nums: [Int]) -> Int {
    
        // 先求出0...n的总和
        var res = (1 + nums.count) * nums.count / 2
        for num in nums {
            
            res -= num
        }
        return res
    }
    
    func missingNumber1(_ nums: [Int]) -> Int {
        
        var res = nums.count
        for i in 0..<nums.count {
            
            res ^= nums[i]
            res ^= i
        }
        return res
    }
}
