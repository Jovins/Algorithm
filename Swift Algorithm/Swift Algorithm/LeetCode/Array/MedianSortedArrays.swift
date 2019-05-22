//
//  MedianSortedArrays.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/22.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class MedianSortedArrays {
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        let m = nums1.count
        let n = nums2.count
        if m > n {
            return findMedianSortedArrays(nums2, nums1)
        }
        let k = (m + n + 1) / 2
        var left = 0
        var right = m
        // num1数组右移，num2数组左移,找出中间位置
        while left < right {
            let m1 = left + (right - left) / 2
            let m2 = k - m1
            if nums1[m1] < nums2[m2 - 1] {
                left = m1 + 1
            } else {
                right = m1
            }
        }
        let m1 = left
        let m2 = k - left
        let re1: Double = Double(max(m1 <= 0 ? Int.min : nums1[m1 - 1], m2 <= 0 ? Int.min : nums2[m2 - 1]))
        if (m + n) % 2 == 1 {
            return re1
        }
        let re2: Double = Double(min(m1 >= m ? Int.max : nums1[m1], m2 >= n ? Int.max : nums2[m2]))
        return (re1 + re2) / 2
    }
}
