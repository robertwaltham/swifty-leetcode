//
//  longest-substring-no-repeats.swift
//  Swifty-Leetcode
//
//  Created by Robert Waltham on 2023-09-16.
//

import Foundation


class Solution_LongestSubstring {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        
        var map = Dictionary<Character, Int>()
        
        var maximum = 0
        var before = -1
        
        for (i, char) in s.enumerated() {
            if let last_seen = map[char] {
                before = max(before, last_seen)
            }
            map[char] = i
            maximum = max(i - before, maximum)
        }
        
        return maximum
    }
}
