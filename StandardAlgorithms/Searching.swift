//
//  Searching.swift
//  StandardAlgorithms
//
//  Created by Agnihotri, Aaryan (Coll) on 15/11/2024.
//

import Foundation

class Searching {
	func linearSearch(_ arr: [Int], _ target: Int) -> Int {
		for i in 0..<arr.count {
			if arr[i] == target { return i }
		}
		return -1
	}

	// arr must be sorted first
	func binarySearch(_ arr: [Int], _ target: Int) -> Int {
		var left = 0
		var right = arr.count

		while left < right {
			let mid = (left + right) / 2
			if arr[mid] > target {
				right = mid
			}
			else if arr[mid] == target {
				return mid
			}
			else {
				left = mid+1
			}
		}

		return -1
	}
}