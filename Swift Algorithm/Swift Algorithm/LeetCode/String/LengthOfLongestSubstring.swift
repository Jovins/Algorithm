//
//  LengthOfLongestSubstring.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/5/16.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class LengthOfLongestSubstring {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        var longest = 0
        var index = 0           // 起点
        var set = Set<Character>()
        let sChars = Array(s)
        for (i, char) in sChars.enumerated() {
            
            if set.contains(char) {
  
                longest = max(longest, i - index)
                while sChars[index] != char {
                    set.remove(sChars[index])
                    index += 1
                }
                index += 1
            } else {
                
                set.insert(char)
            }
        }
        return max(longest, sChars.count - index)
    }
}
