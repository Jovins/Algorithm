//
//  LongestPalindrome.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/27.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class LongestPalindrome {
    
    // 中心扩展法, 也会超出时间限制
    func longestPalindrome(_ s: String) -> String {
        
        guard s.count > 1 else {
            return s
        }
        var start = 0, end = 0, len = 0
        for i in 0..<s.count {
            
            let len1 = expandAroundCenter(s, i, i)
            let len2 = expandAroundCenter(s, i, i + 1)
            len = max(len1, len2)
            if len > end - start + 1 {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        let startStr = s.suffix(s.count - start)
        let res = String(startStr.prefix(end - start + 1))
        return res
    }
    // abcdcba
    //  <- ->
    func expandAroundCenter(_ s: String, _ left: Int, _ right: Int) -> Int {
        
        var left = left, right = right
        let cStr = Array(s)
        while left >= 0 && right < s.count && cStr[left] == cStr[right] {
            
            left -= 1
            right += 1
        }
        return right - left - 1
    }
    
    // 比暴力法高效, 但最后一个测试用例会超出时间限制
    func longestPalindrome1(_ s: String) -> String {
        
        if s.count == 1 {
            return s
        }
        var rev = Array(s)
        var sRes = Array(s)
        var res = ""
        reverse(&rev, 0, rev.count - 1)
        if s == String(rev) {
            return s
        }
        var len = 0
        for i in 0..<sRes.count {
            
            var temp = ""
            for j in i..<sRes.count {
                
                temp = temp + String(sRes[j])
                if len >= temp.count {
                    continue
                } else if String(rev).contains(temp) {
                    
                    // 验证temp是否是回文子串
                    var test = Array(temp)
                    reverse(&test, 0, test.count - 1)
                    if temp == String(test) {
                        
                        len = temp.count
                        res = temp
                    }
                } else {
                    break
                }
            }
            temp = ""
        }
        return res
    }
    
    // 字符串反转
    func reverse<T>(_ chars: inout [T], _ start: Int,_ end: Int) {
        var start = start, end = end
        while start <= end {
            swaps(&chars, start, end)
            start += 1
            end -= 1
        }
    }
    
    func swaps<T>(_ chars: inout [T], _ s: Int, _ e: Int) {
        (chars[s], chars[e]) = (chars[e], chars[s])
    }
}
