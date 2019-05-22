//
//  MeetingTime.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/3/22.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

public class MeetingTime {
    
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

public class Meeting {
    
    func merge(meetingTimes: [MeetingTime]) -> [MeetingTime] {
        
        var meetings = meetingTimes
        // 处理特殊情况
        guard meetingTimes.count > 1 else {
            return meetingTimes
        }
        
        // 排序
        meetings = meetings.sorted() {
            if $0.start != $1.start {
                return $0.start < $1.start
            } else {
                return $0.end < $1.end
            }
        }
        
        // 新建结果数组
        var res = [MeetingTime]()
        res.append(meetings[0])
        
        // 遍历排序后的原数组，并与结果数组归并
        for i in 1..<meetings.count {
            let last = res[res.count - 1]
            let current = meetingTimes[i]
            if current.start > last.end {
                res.append(current)
            } else {
                last.end = max(last.end, current.end)
            }
        }
        
        return res
    }
}
