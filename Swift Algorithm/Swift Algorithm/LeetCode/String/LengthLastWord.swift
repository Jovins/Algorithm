//
//  LengthLastWord.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/27.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class LengthLastWord {
    
    func lengthOfLastWord(_ s: String) -> Int {
     
        var len = 0
        let sChars = Array(s)
        guard sChars.count != 0 else {
            return 0
        }
        for i in (0...sChars.count - 1).reversed() {
            
            if len == 0 {
                
                if sChars[i] == " " {   // 判断末尾是否有空格
                    continue
                } else {
                    len += 1
                }
            } else {
                
                if sChars[i] == " " {
                    break
                } else {
                    len += 1
                }
            }
        }
        return len
    }
}
