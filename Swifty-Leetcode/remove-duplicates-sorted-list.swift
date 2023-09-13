//
//  remove-duplicates-sorted-list.swift
//  Swifty-Leetcode
//
//  Created by Robert Waltham on 2023-09-12.
//

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    public func toArray() -> [Int] {
        var result = [Int]()
        
        var head = self
        while head.next != nil {
            result.append(head.val)
            head = head.next!
        }
        result.append(head.val)

        return result
    }
    
    public static func fromArray(arr: [Int]?) -> ListNode? {
        guard let arr else {
            return nil
        }
        guard arr.count != 0 else {
            return nil
        }
        
        let head = ListNode(arr[0])
        var cursor = head;
        for i in 1..<arr.count {
            cursor.next = ListNode(arr[i], nil)
            
            cursor = cursor.next!
        }
        
        return head
    }
    
}
 

class Solution_DeleteDuplicates {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head else {
            return nil
        }
        
        guard head.next != nil else {
            return head
        }
        
        var slow = head
        var fast = head.next!
    
        while fast.next != nil {
            if slow.val == fast.val {
                fast = fast.next!
                slow.next = fast
            } else if fast.next != nil {
                fast = fast.next!
                slow = slow.next!
            }
        }
        
        if slow.val == fast.val {
            slow.next = nil
        }
        
        return head
    }
}
