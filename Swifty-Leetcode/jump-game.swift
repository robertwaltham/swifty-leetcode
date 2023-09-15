//
//  jump-game.swift
//  Swifty-Leetcode
//
//  Created by Robert Waltham on 2023-09-14.
//

import Foundation


class Solution_JumpGame {
    func canJump(_ nums: [Int]) -> Bool {
        var index = 0
        var steps = [Int]()
        var nums = nums
        while true {
            
            if index >= nums.count - 1 {
                return true
            }
            
            if nums[index] + index > nums.count - 1 {
                return true
            }
            
            if nums[index] == 0 {
                
                if index == 0 {
                    return false
                } else {
                    index = steps.popLast()!
                    nums[index] -= 1;
                }
                
            } else {
                steps.append(index)
                index += nums[index]
            }
        }
    }
}


/*

 - if we're at the end, return true
 - if the number of steps now is 0
    - take a step back to the previous state
    - if the number of steps we took last time is > 1
        - decement number of steps to take
    - else
        - take another step back
        - if we hit the beginning, return false
 - else advance number of steps

 
 */
