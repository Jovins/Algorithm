//
//  CountAndSay.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/6/8.
//  Copyright © 2019 Jovins. All rights reserved.
//

import UIKit

class CountAndSay {
    
    // 递归
    func countAndSay(_ n: Int) -> String {
        
        if n == 1 {
            return "1"
        }
        let lastStr = countAndSay(n - 1)
        var charStr = Array(lastStr)
        var count = 1
        var res = ""
        for i in 0..<charStr.count - 1 {
            
            if charStr[i] == charStr[i + 1] {
                count += 1
                continue
            } else {
                res += String(count) + String(charStr[i])
                count = 1
            }
        }
        return res + String(count) + String(charStr[charStr.count - 1])
    }
    
    // 暴力法
    func countAndSay1(_ n: Int) -> String {
        
        switch n {
        case 1:
            return "1"
        case 2:
            return "11"
        case 3:
            return "21"
        case 4:
            return "1211"
        case 5:
            return "111221"
        case 6:
            return "312211"
        case 7:
            return "13112221"
        case 8:
            return "1113213211"
        case 9:
            return "31131211131221"
        case 10:
            return "13211311123113112211"
        case 11:
            return "11131221133112132113212221"
        case 12:
            return "3113112221232112111312211312113211"
        case 13:
            return "1321132132111213122112311311222113111221131221"
        case 14:
            return "11131221131211131231121113112221121321132132211331222113112211"
        default:
            return "等等，不推荐"
        }
    }
}
