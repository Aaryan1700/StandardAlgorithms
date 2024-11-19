//
//  Unknown.swift
//  StandardAlgorithms
//
//  Created by Agnihotri, Aaryan (Coll) on 19/11/2024.
//

import Foundation

class Unknown {
    // Sum of first and last items of an integer array. If empty, return 0
    func sumFirstLast(_ arr: [Int]) -> Int {
        let n = arr.count
        if n == 0 { return 0 }
        return arr[0] + arr[n-1]
    }
    
    // Mode of sorted integer array, return nil if empty
    func modeSortedArray(_ arr: [Int]) -> Int? {
        let n = arr.count
        
        if n == 0 { return nil }
        
        var runningTotal = 0
        var curr = 0
        var modeCount = 0
        var mode = 0
        
        for num in arr {
            if num != curr {
                if runningTotal > modeCount {
                    modeCount = runningTotal
                    mode = curr
                }
                runningTotal = 1
                curr = num
            }
            else {
                runningTotal += 1
            }
        }
        
        return runningTotal > modeCount ? curr : mode
    }
    
    // Second smallest value of an integer array (not including repeats). If less than 2 items or all equal items, return nil
    func secondSmallestInArray(_ arr: [Int]) -> Int? {
        let n = arr.count
        
        if n < 2 { return nil }
        
        var smallest = Int.max
        var secondSmallest = Int.max
        
        for num in arr {
            if num < smallest {
                secondSmallest = smallest
                smallest = num
            }
        }
        
        return secondSmallest == Int.max ? nil : secondSmallest
    }
    
    // Mode of unsorted integer arry, return nil if empty
    func modeUnsortedArray(_ arr: [Int]) -> Int? {
        let n = arr.count
        
        if n == 0 { return nil }
        
        var elementCounts: [Int: Int] = [:]

        var mode = 0
        
        for num in arr {
            elementCounts[num, default: 0] += 1
            if elementCounts[num, default: 0] > elementCounts[mode, default: -1] {
                mode = num
            }
        }
        
        return elementCounts[mode]
    }
    
    // Extract domain name from a URL
    func extractDomainName(_ url: String) -> String {
        let validTLDs: [String] = ["com", "co", "org", "net", "int", "edu", "gov"]
        var runningString: String = ""
        var prevString: String = ""
        
        for char in url {
            if char == "." {
                if validTLDs.contains(runningString) {
                    return prevString
                }
                else {
                    prevString = runningString
                    runningString = ""
                }
            }
            else {
                runningString += String(char)
            }
        }
        
        if validTLDs.contains(runningString) {
            return prevString
        }
        
        return ""
    }
    
}
