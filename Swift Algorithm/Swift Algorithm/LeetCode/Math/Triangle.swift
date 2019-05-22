//
//  Triangle.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/16.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

/*
 * 数塔问题
 * 给定一个正整数构成的三角形，如下所示：
 *     7
 *    3 8
 *   8 1 0
 *  2 7 4 4
 * 4 5 2 6 5
 * 在上面的数字三角形中寻找一条从顶部到底边的路径，
 * 使得路径上所经过的数字之和最大。
 * 路径上的每一步都只能往左下或者右下走。
 * 只需要求出这个最大和即可，不必给出路径。
 * 三角形的行数大于1小于等于100，整数为0~99
 *
 * 输入样例：
 * 5 -- 三角形的行数
 *
 * 7 0 0 0 0
 * 3 8 0 0 0
 * 8 1 3 0 0
 * 2 7 4 4 0
 * 4 5 2 6 5
 *
 * */

/*
 * 思路分析：
 * 使用二维数组来存放数字三角形
 * 然后使用D（x,y）来表示第x行第y个数字（x，y从1开始算）
 * 使用MaxSum（x，y）表示从D（x，y）到底边的各条路径中，最佳路径的数字和。
 * 因此，此问题就转换为求MaxSum（1,1）
 * 这时，首先想到的就是可以使用简单的递归思想来求解
 * D（x，y）出发，下一步只能走D（x+1，y）或者D（x+1，y+1）。所以，对于N行的三角形，
 * 可以写出下面的递归算式：
 *  if(x==N)
 *      MaxSum(x,y)=D(x,y)
 *  else
 *      MaxSum(x,y)=Max(MaxSum(x+1,y),MaxSum(x+1,y+1))+D(x,y)
 *  但是，这个算法存在重复计算的问题，而且效率不好。
 *
 * 使用动态规划解决的思路。
 * 1、确定一个状态：把当前位置（x，y）看成一个状态，然后定义状态（x，y）的指标函数d（x，y）为
 *   从（x，y）出发时能够得到的最大和（包括位置（x，y）本身的值）。在这个状态定义下，原问题的
 *   解是d（1,1）
 * 2、确定状态转移方程
 *   从位置（x，y）出发有两种策略。如果往下走，则走到（x+1，y）后需求“从（x+1，y）出发后能得到的最大和”这一问题，
 *   即d（x+1，y）。
 *   如果往右下走，则走到（x+1，y+1）后需求“从（x+1，y+1）出发后能得到的最大和”这一问题，即d（x+1，y+1）
 *   由于可以在这两个决策中自由选择，所以应选择d（x+1，y）和d（x+1，y+1）中较大的一个。
 *   所以，所谓的状态转移方程为：
 *    d（x，y）= a（x，y）+max（d（x+1，y），d（x+1，y+1））
 *
 *   动态规划的核心是确立状态转移方程。
 * */
class Triangle {
    
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        
        guard !triangle.isEmpty else {
            return 0
        }
        var mins = triangle.last!
        for i in (0..<triangle.count - 1).reversed() {
            
            let rows = triangle[i]
            for j in (0..<rows.count) {
        
                mins[j] = rows[j] + min(mins[j], mins[j + 1])
            }
        }
        return mins[0]
    }
}
