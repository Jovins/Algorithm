//
//  RemoveElement.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/24.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class RemoveElement {
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        
        // 第二种方法
        nums = nums.filter { $0 != val }
        return nums.count
        // 第一种方法
        // nums = nums.filter { (num) in num != val }
        // return nums.count
    }
}
