//
//  ReverseInteger.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/17.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class ReverseInteger {
    
    func reverse(_ x: Int) -> Int {
        
        var result = 0
        var x = x
        while x != 0 {
            // 判断是否溢出
            if result > Int(Int32.max) / 10 ||  result < Int(Int32.min) / 10 {
                return 0
            }
            result = result * 10 + x % 10
            x = x / 10
        }
        return result
    }
}
