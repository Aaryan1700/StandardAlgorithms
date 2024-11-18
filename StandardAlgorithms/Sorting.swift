//
//  Sorting.swift
//  StandardAlgorithms
//
//  Created by Agnihotri, Aaryan (Coll) on 15/11/2024.
//

import Foundation

class Sorting {
	// Helper function for swapping elements at indices of an array
	func swap(_ arr: inout [Int], _ i: Int, _ j: Int) -> Void {
    	let temp: Int = arr[i]
    	arr[i] = arr[j]
    	arr[j] = temp
    }
	
	func bubbleSort(_ arr: inout [Int]) -> Void {
		let n: Int = arr.count
		var flag: Bool = true
		while flag {
			flag = false
			for i in 0...n-2 {
				if arr[i] > arr[i+1] { 
					swap(&arr, i, i+1)
					flag = true
				}
			}
		}
	}

	func merge(_ arr: inout [Int], _ start: Int, _ middle: Int, _ end: Int) -> Void {
	    var temp: [Int] = []
	
	    for r in start..<end {
	        temp.append(arr[r])
	    }
	
		var i: Int = 0
		var j: Int = middle - start
		var k: Int = start

		while i < middle-start && j < end-start {
			if temp[i] < temp[j] {
				arr[k] = temp[i]
				i += 1
			}
			else {
				arr[k] = temp[j]
				j += 1
			}
			k += 1
		}

		while i < middle-start {
			arr[k] = temp[i]
			i += 1
			k += 1
		}
		while j < end-start {
			arr[k] = temp[j]
			j += 1
			k += 1
		}
	}

	func mergeSortHelper(_ arr: inout [Int], _ start: Int, _ end: Int) -> Void {
		if end - start > 1 {
		    let mid: Int = (start + end) / 2
			mergeSortHelper(&arr, start, mid)
			mergeSortHelper(&arr, mid, end)
		    merge(&arr, start, mid, end)
		}
	}

	func mergeSort(_ arr: inout [Int]) -> Void {
		mergeSortHelper(&arr, 0, arr.count)
	}
    
    // Return implementation; doesn't mutate the input array
    func quickSorted(_ arr: [Int]) -> [Int] {
        let n = arr.count
        if n <= 1 { return arr }

		let pivot = arr[0]
        var pivots = [arr[0]]
        var left: [Int] = []
        var right: [Int] = []
    
        for num in arr {
            if num < pivot { left.append(num) }
			else if num == pivot { pivots.append(num) }
            else { right.append(num) }
        }
    
        return quickSorted(left) + pivots + quickSorted(right)
    }
    
    // In-place implementation
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

	func insertionSort(_ arr: inout [Int]) -> Void {
    	for i in 1..<arr.count {
    	    var k = i
    	    while k > 0 && arr[k-1] > arr[k] {
    	        swap(&arr, k-1, k)
    	        k -= 1	
    		}
		}
	}
}