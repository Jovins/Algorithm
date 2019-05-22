//
//  ValidPalindrome.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/22.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class ValidPalindrome {
    
    func isPalindrome(_ x: Int) -> Bool {
        
        // x < 0: 不是回文数
        // x最后一位为0也不是回文数
        // 第一位数字也不能为0
        var x = x
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        var res = 0
        while x > res {
            
            res = res * 10 + x % 10
            x /= 10
        }
        // res / 10 ? 因为x的位数g为奇数时，res会比x多一位
        // 比如: 12321, 那么 x = 12, res = 123, 所以res要去掉一位才可以判断
        return x == res || x == res / 10
    }
    
    func isPalindrome1(_ x: Int) -> Bool {
        
        if (x < 10 && x >= 0) {
            return true
        }
        let chars: [Character] = Array(String(x))
        var pre = 0
        var las = chars.count - 1
        while pre < las {
            
            if chars[pre] == chars[las] {
                
                pre += 1
                las -= 1
            } else {
                return false
            }
        }
        return true
    }
}
