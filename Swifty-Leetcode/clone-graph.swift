//
//  clone-graph.swift
//  Swifty-Leetcode
//
//  Created by Robert Waltham on 2023-09-18.
//

import Foundation


public class Node {
     public var val: Int
     public var neighbors: [Node?]
     public init(_ val: Int) {
         self.val = val
         self.neighbors = []
     }
}
 

class Solution_CloneGraph {
    func cloneGraph(_ node: Node?) -> Node? {
        
        let adj = Dictionary<Int, [Int]>()
        
        // breadth first search, storing each adjacency list in the hash
        // only need to hit each node once, and depth first could result in repeated efforts
        // create new nodes for each entry in the dictionary
        // create new adjacency lists for each node
        // return node 1
        
        return nil
    }
}
