//
//  Sorting.swift
//  StandardAlgorithms
//
//  Created by Agnihotri, Aaryan (Coll) on 15/11/2024.
//

import Foundation

class Sorting {
    
    // Return implementation, doesn't mutate the input array
    func quickSorted(_ arr: [Int]) -> [Int] {
        let n = arr.count
        if n <= 1 { return arr }
    
        let pivot = arr[0]
        var left: [Int] = []
        var right: [Int] = []
    
        for num in arr.dropFirst() {
            if num < pivot { left.append(num) } 
            else { right.append(num) }
        }
    
        return quickSorted(left) + [pivot] + quickSorted(right)
    }
    
    // In-place implementation
    func swap(_ arr: inout [Int], _ i: Int, _ j: Int) -> Void {
    	let temp: Int = arr[i]
    	arr[i] = arr[j]
    	arr[j] = temp
    }
    
    func quickSortHelper(_ arr: inout [Int], _ start: Int, _ end: Int) -> Void {
    	if end > start {
    		let pivot: Int = arr[start]
    		var i: Int = start
    		var j: Int = end
    
    		while true {
    			i += 1
    			while i < end && arr[i] < pivot {
    				i += 1
    			}
    			j -= 1
    			while j > start && arr[j] > pivot {
    				j -= 1
    			}
    			if j <= i { break }
    			swap(&arr, i, j)
    		}
    		swap(&arr, start, j)
    
    		quickSortHelper(&arr, start, j)
    		quickSortHelper(&arr, j+1, end)
    	}
    }
    
    func quickSort(_ arr: inout [Int]) -> Void {
        quickSortHelper(&arr, 0, arr.count)
    }
    
}
