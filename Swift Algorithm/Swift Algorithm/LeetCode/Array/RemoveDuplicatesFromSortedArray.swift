//
//  RemoveDuplicatesFromSortedArray.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/22.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class RemoveDuplicatesFromSortedArray {
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        guard nums.count > 0 else {
            return 0
        }
        var index = 0
        for num in nums where num != nums[index] {
            
            index += 1
            nums[index] = num
        }
        return index + 1
    }
    
    func removeDuplicates1(_ nums: inout [Int]) -> Int {
        
        guard nums.count > 0 else {
            return 0
        }
        var i = 0
        for j in 1..<nums.count {
            
            if nums[i] != nums[j] {
                
                i += 1
                nums[i] = nums[j]
            }
        }
        return i + 1
    }
}
