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
            let result = Solution.init().deleteDuplicates(inputNode)
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

}
