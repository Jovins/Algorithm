//
//  LongestCommonPrefix.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/23.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class LongestCommonPrefix {
    
    func longestCommonPrefix(_ strs: [String]) -> String {
     
        // 选择第一个字符串作为对照标准，遍历数组
        // 将数组中单个字符一一对比，只要不同就可以返回
        var res = [Character]()
        // 如果为空 返回”“
        guard let first = strs.first else {
            return ""
        }
        let firstArray = Array(first) // 字符串转数组
        let strArray = strs.map { Array($0) } // 字符串转字符数组
        var index = 0
        while index < first.count {
            
            res.append(firstArray[index])
            for str in strArray {
                
                if index >= str.count {
                    
                    return String(res.dropLast()) // 去掉最后那个字符
                }
                if str[index] != res[index] {
                    
                    return String(res.dropLast())
                }
            }
            index += 1
        }
        return String(res)
    }
}
