//
//  MaxArea.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/23.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class MaxArea {
    
    func maxArea(_ height: [Int]) -> Int {
     
        var res = 0, left = 0, right = height.count - 1
        while left < right {
            
            res = max(res, min(height[left], height[right]) * (right - left))
            if height[left] < height[right] {
                
                left += 1
            } else {
                
                right -= 1
            }
        }
        return res
    }
}
