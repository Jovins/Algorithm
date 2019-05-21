//
//  DistributeCandies.swift
//  Swift Algorithm
//
//  Created by 黄进文 on 2019/5/16.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class DistributeCandies {
    
    func distributeCandies(_ candies: [Int]) -> Int {
        
        var set = Set<Int>()
        for i in candies {
            
            if !set.contains(i) {
             
                set.insert(i)
            }
        }
        let nums = set.count
        let target = candies.count / 2  // 最多只能分这么多
        return nums >= target ? target : nums
    }
}
