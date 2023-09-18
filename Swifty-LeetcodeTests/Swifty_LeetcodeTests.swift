//
//  Swifty_LeetcodeTests.swift
//  Swifty-LeetcodeTests
//
//  Created by Robert Waltham on 2023-09-12.
//

import XCTest
@testable import Swifty_Leetcode

final class Swifty_LeetcodeTests: XCTestCase {

    func testRemoveDuplicateSortedList() {
        
        
        func testCase(input: [Int]?, expected: [Int]?) {
            
            let inputNode = ListNode.fromArray(arr: input)
            let result = Solution_DeleteDuplicates.init().deleteDuplicates(inputNode)
            let resultArr = result?.toArray()
            
            XCTAssertEqual(resultArr, expected, "expected \(String(describing: resultArr)) to equal \(String(describing: expected))")

        }
        
        testCase(input: nil, expected: nil)
        testCase(input: [1], expected: [1])
        testCase(input: [1, 2, 3], expected: [1, 2, 3])
        testCase(input: [1, 1, 2, 2, 3], expected: [1, 2, 3])
        testCase(input: [1, 2, 2, 3], expected: [1, 2, 3])
        testCase(input: [1, 2, 3, 3], expected: [1, 2, 3])
        testCase(input: [1, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3], expected: [1, 2, 3])

    }
    
    func testClimbStairs() {
        
        func testCase(stairs: Int, expected: Int) {
            XCTAssertEqual(Solution_ClimbStairs.climbStairs(stairs), expected)
        }
        
        testCase(stairs: 0, expected: 0)
        testCase(stairs: 1, expected: 1)
        testCase(stairs: 2, expected: 2)
        testCase(stairs: 3, expected: 3)
        testCase(stairs: 4, expected: 5)
        testCase(stairs: 5, expected: 8)
        testCase(stairs: 6, expected: 13)
    }
    
    func testJumpGame() {
        func testCase(nums: [Int], expected: Bool) {
            XCTAssertEqual(Solution_JumpGame().canJump(nums), expected)
        }
        
        testCase(nums: [2,3,1,1,4], expected: true)
        testCase(nums: [3,2,1,0,4], expected: false)
        testCase(nums: [1], expected: true)
        testCase(nums: [0], expected: true)
        testCase(nums: [2, 2, 0, 3, 3, 0], expected: true)
        testCase(nums: [5, 6, 1, 0, 0, 0], expected: true)

    }
    
    
    func testTaskScheduler() {
        func testCase(tasks: [Character], n: Int, expected: Int) {
            XCTAssertEqual(Solution_TaskScheduler().leastInterval(tasks, n), expected)
        }

        testCase(tasks: ["A","A","A","B","B","B"], n: 2, expected: 8)
        testCase(tasks: ["A","A","A","B","B","B"], n: 0, expected: 6)
        testCase(tasks: ["A","A","A","A","A","A","B","C","D","E","F","G"], n: 2, expected: 16)
        testCase(tasks: ["A","A","A","B","B"], n: 0, expected: 5)

    }
    
    
    func testLongestSubstringNoRepeats() {
        func testCase(s: String, expected: Int) {
            XCTAssertEqual(Solution_LongestSubstring().lengthOfLongestSubstring(s), expected)
        }
        testCase(s: "a", expected: 1)
        testCase(s: "au", expected: 2)

        
        testCase(s: "aaaaaaa", expected: 1)
        testCase(s: "abcdefg", expected: 7)
        testCase(s: "abcabcbb", expected: 3)
        testCase(s: "pwwkew", expected: 3)
        testCase(s: "", expected: 0)
    }
    
    func testLongestSubarraySum() {
        func testCase(nums: [Int], expected: Int) {
            XCTAssertEqual(Solution_LongestSubarray().maxSubArray(nums), expected)
        }
        
        testCase(nums: [], expected: 0)
        testCase(nums: [0], expected: 0)
        testCase(nums: [1], expected: 1)
        testCase(nums: [-1], expected: -1)
        testCase(nums: [-2,1,-3,4,-1,2,1,-5,4], expected: 6)
        testCase(nums: [5,4,-1,7,8], expected: 23)
    }
}
