//
//  GetClimbingWays.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/16.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

// 有一个楼梯总共n个台阶，只能往上走，每次只能上1个、2个台阶，总共有多少种走法。
class GetClimbingWays {
    
    func getClimbingWays(_ n: Int) -> Int {
        
        if n < 1 {
            return 0
        }
        if n == 1 {
            return 1
        }
        if n == 2 {
            return 2
        }
        
        var a = 1
        var b = 2
        var temp = 0
        for _ in 3..<n {
            temp = a + b
            a = b
            b = temp
        }
        return temp
    }
}
