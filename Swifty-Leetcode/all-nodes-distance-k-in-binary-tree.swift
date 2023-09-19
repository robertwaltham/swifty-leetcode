//
//  all-nodes-distance-k-in-binary-tree.swift
//  Swifty-Leetcode
//
//  Created by Robert Waltham on 2023-09-19.
//

import Foundation


public class TreeNode_DistanceK {
    public var val: Int
    public var left: TreeNode_DistanceK?
    public var right: TreeNode_DistanceK?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
 
class Solution_DistanceK {
    func distanceK(_ root: TreeNode_DistanceK?, _ target: TreeNode_DistanceK?, _ k: Int) -> [Int] {
        
        var parents = Dictionary<Int, TreeNode_DistanceK>()
        var trail = [TreeNode_DistanceK]()
        
        guard k > 0 else {
            return [target?.val ?? -1]
        }
        
        func distanceK(_ root: TreeNode_DistanceK?, _ target: TreeNode_DistanceK?, _ k: Int, found: Bool) -> [Int]{
            
            guard root != nil else {
                return []
            }
            
            guard k >= 0 else {
                return []
            }

            if found && k == 0 {
                if target?.val != root?.val {
                    return [root!.val]
                } else {
                    return []
                }
            } else if found && k > 0 {
                var left = [Int]()
                if !trail.contains(where: { $0.val == root?.left?.val ?? -1 }) {
                    left = distanceK(root?.left, target, k - 1, found: found)
                }
                
                var right = [Int]()
                if !trail.contains(where: { $0.val == root?.right?.val ?? -1 }) {
                    right = distanceK(root?.right, target, k - 1, found: found)
                }

                return left + right
            } else {
                
                if let left_child = root?.left {
                    parents[left_child.val] = root
                }
                if let right_child = root?.right {
                    parents[right_child.val] = root
                }
                
                let found = root?.val == target?.val
                var parent_total = [Int]()
                if found {
                    var cursor: TreeNode_DistanceK? = parents[root!.val]
                    var parent_k = k - 1
                    
                    while cursor != nil {
                        trail.append(cursor!)
                        cursor = parents[cursor!.val]
                    }
                    
                    for parent_node in trail {
                        print("\(parent_node.val) \(parent_k)")
                        parent_total += distanceK(parent_node, target, parent_k, found: true)
                        parent_k -= 1
                    }
                    
                }
                
                let left = distanceK(root?.left, target, found ? k - 1 : k, found: found)
                let right = distanceK(root?.right, target, found ? k - 1 : k, found: found)
                return left + right + parent_total
            }
        }
        
        return distanceK(root, target, k, found: false)
    }
}
