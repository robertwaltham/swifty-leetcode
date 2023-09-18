//
//  longest-subarray-sum.swift
//  Swifty-Leetcode
//
//  Created by Robert Waltham on 2023-09-16.
//

import Foundation


class Solution_LongestSubarray {
    func maxSubArray(_ nums: [Int]) -> Int {
        
        guard nums.count > 0 else {
            return 0
        }
        
        var maximum = Int.min
        var current = 0
        
        for i in nums {
            current += i
            maximum = max(current, maximum)
            if current < 0 {
                current = 0
            }
        }
        
        return maximum
    }
}
