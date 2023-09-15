//
//  task-scheduler.swift
//  Swifty-Leetcode
//
//  Created by Robert Waltham on 2023-09-14.
//

import Foundation

class Solution_TaskScheduler {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        
        struct Entry: Hashable {
            var key: Character
            var value: Int
        }
        
        func addToBinaryHeap(entry: Entry, heap: CFBinaryHeap?) {
            assert(entry.value > 0, "should not add zero")
            var entryPointer : UnsafeMutablePointer<Entry>!
            entryPointer = UnsafeMutablePointer<Entry>.allocate(capacity: 1)
            entryPointer.initialize(to: entry)
            CFBinaryHeapAddValue(bh, entryPointer)
        }
        
        func popLargestFromBinaryHeap(heap: CFBinaryHeap?) -> Entry {
            let min = CFBinaryHeapGetMinimum(bh)!
            let min_entry = min.load(as: Entry.self)
            CFBinaryHeapRemoveMinimumValue(bh)
            return min_entry
        }
        
        var map = Dictionary<Character, Int>()
        for i in 0..<tasks.count {
            let char = tasks[i]
            if let value = map[char] {
                map[char] = value + 1
            } else {
                map[char] = 1
            }
        }

        var callbacks = CFBinaryHeapCallBacks()

        callbacks.compare = { (a,b,unused) in
            let a_entry: Entry = a!.load(as: Entry.self)
            let b_entry: Entry = b!.load(as: Entry.self)

            if ( a_entry.value == b_entry.value ) { return CFComparisonResult.compareEqualTo }
            if ( a_entry.value < b_entry.value ) { return CFComparisonResult.compareGreaterThan } // min heap => max heap
            return CFComparisonResult.compareLessThan
        }

        let callbackPointer = UnsafeMutablePointer<CFBinaryHeapCallBacks>.allocate(capacity: 1)
        callbackPointer.initialize(to: callbacks)
        let bh = CFBinaryHeapCreate(nil, 0, callbackPointer, nil)
        
        for (key, value) in map {
            let entry = Entry(key: key, value: value)
            addToBinaryHeap(entry: entry, heap: bh)
        }
        
        var tasks_run = 0
        var iterations = 0
        var cooldown = Dictionary<Entry, Int>()
                
        while tasks_run < tasks.count {
            iterations += 1
                                    
            if CFBinaryHeapGetCount(bh) > 0 {
                tasks_run += 1
                
                var next_task = popLargestFromBinaryHeap(heap: bh)
                print(next_task.key)
                
                if next_task.value > 1 {
                    next_task.value -= 1
                    
                    if n > 0 {
                        cooldown[next_task] = n
                    } else {
                        addToBinaryHeap(entry: next_task, heap: bh)
                    }
                }
                
                if tasks_run == tasks.count {
                    return iterations
                }
            }
            
            for entry in cooldown.keys {
                let cooldown_count = cooldown[entry]!
                if cooldown_count <= 0 {
                    addToBinaryHeap(entry: entry, heap: bh)
                    cooldown.removeValue(forKey: entry)
                } else {
                    cooldown[entry] = cooldown_count - 1
                }
            }
        }
        
        return 0
    }
}
