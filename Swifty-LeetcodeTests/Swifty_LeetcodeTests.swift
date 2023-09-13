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

}
