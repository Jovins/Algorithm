//
//  ValidParentheses.swift
//  Swift Algorithm
//
//  Created by 黄进文 on 2019/5/17.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

class ValidParentheses {
    
    func isValid(_ s: String) -> Bool {
        
        var stack = [Character]()
        for char in s {
            
            if char == "(" || char == "[" || char == "{" {
                
                stack.append(char)
            } else if char == ")" {
                
                guard stack.count != 0 && stack.removeLast() == "(" else {
                    return false
                }
            } else if char == "]" {
                
                guard stack.count != 0 && stack.removeLast() == "[" else {
                    return false
                }
            } else if char == "}" {
                
                guard stack.count != 0 && stack.removeLast() == "{" else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}
