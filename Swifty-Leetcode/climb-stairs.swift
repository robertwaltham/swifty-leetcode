//
//  climb-stairs.swift
//  Swifty-Leetcode
//
//  Created by Robert Waltham on 2023-09-12.
//

import Foundation

class Solution_ClimbStairs {
    static func climbStairs(_ n: Int) -> Int {
        guard n != 0 else { return 0 }
        guard n != 1 else { return 1 }
        
        var a = 1
        var b = 1
        for _ in 0..<n-1 {
            let c = a + b
            a = b
            b = c
        }
        
        return b
    }
}
