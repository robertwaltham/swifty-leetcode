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
    
    func testCloneGraph() {
        func createGraph(adj: [[Int]]) -> Node? {
            guard adj.count > 0 else {
                return nil
            }
            
            var nodes = [Node]()
            for i in 0..<adj.count {
                nodes.append(Node(i + 1)) // first value is 1 not 0
            }
            
            for i in 0..<adj.count {
                nodes[i].neighbors = adj[i].map({ j in
                    nodes[j - 1]
                })
            }
            
            return nodes[0]
        }
    
        
        func testCase(adj: [[Int]]) {
            let graph = createGraph(adj: adj)
            let clone = Solution_CloneGraph().cloneGraph(graph)
            print(clone as Any)
        }
        
        testCase(adj: [[2,4],[1,3],[2,4],[1,3]])
    }
    
    
    func testDistanceK() {
        
        func testCase(nodes: [Int?], target: Int, distance: Int, expected: [Int]) {
            if let (root, target) = createGraph(nodes: nodes, target: target) {
                XCTAssertEqual(Solution_DistanceK().distanceK(root, target, distance), expected)
            }
        }
        
        func createGraph(nodes: [Int?], target: Int) -> (TreeNode_DistanceK, TreeNode_DistanceK)? {
            
            guard nodes.count > 0 else {
                return nil
            }
            
            let tree_nodes = nodes.map { $0 != nil ? TreeNode_DistanceK($0!) : nil }
            let root = tree_nodes[0]!
            
            var target_node: TreeNode_DistanceK? = nil
            for (i, node) in tree_nodes.enumerated() {
                let parent = (i - 1) / 2
                if i > 0 && node != nil {
                    if i % 2 == 0 {
                        tree_nodes[parent]?.right = node
                    } else {
                        tree_nodes[parent]?.left = node
                    }
                }
                
                if node?.val == target {
                    target_node = node
                }
            }
        
            return (root, target_node!)
        }
        
        testCase(nodes: [3,5,1,6,2,0,8,nil,nil,7,4], target: 5, distance: 2, expected: [7,4,1])
        testCase(nodes: [0,2,1,nil,nil,3], target: 3, distance: 3, expected: [2])
        testCase(nodes: [0,1,nil,3,2], target: 2, distance: 1, expected: [1])
        // TODO: fix input format, this test case doesn't work due to the input array not being laid out as absolute positions and rather relative to previous nodes
        testCase(nodes: [0,1,nil,nil,2,nil,3,nil,4], target: 3, distance: 0, expected: [3])
        // TODO: this case fails
        testCase(nodes: [0,1,2,nil,3,nil,5,4], target: 3, distance: 3, expected: [2])

    }
}
