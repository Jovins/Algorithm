//
//  ZConvert.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/22.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class ZConvert {
    
    func convert(_ s: String, _ numRows: Int) -> String {
        
        if numRows == 1 {
            return s
        }
        var res: [Character] = []
        var chars: [Character] = Array(s)
        let count = chars.count
        let len = 2 * numRows - 2 // 每个Z首字母差长度
        for i in 0..<numRows {
            
            var index = i
            while index < count {
                
                res.append(chars[index])
                if i != 0 && i != numRows - 1 { // 排除首尾
                    
                    let k = index + 2 * (numRows - i - 1)
                    if k < count {
                        res.append(chars[k])
                    }
                }
                index += len    // 循环下一个Z
            }
        }
        return String(res)
    }
}
