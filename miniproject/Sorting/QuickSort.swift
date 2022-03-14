//
//  QuickSort.swift
//  miniproject
//
//  Created by Li Tzu Lin on 2022-03-09.
//

import Foundation


// Merge Sort
// Time Complexity: O(N lgN)
// Space Complexity: O(N)
func mergeSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  let mid = arr.count / 2
  let sortedLeft = mergeSort(Array(arr[..<mid]), comparator)
  let sortedRight = mergeSort(Array(arr[mid...]), comparator)
  return merge(sortedLeft, sortedRight, comparator)
}

// Time Complexity: O(N)
func merge<T: Comparable>(_ l: [T], _ r: [T], _ comparator: (T, T) -> Bool) -> [T] {
  var i = 0
  var j = 0
  var merged: [T] = []
  while true {
    guard i < l.count else {
      merged.append(contentsOf: r[j...])
      break
    }
    guard j < r.count else {
      merged.append(contentsOf: l[i...])
      break
    }
    if comparator(l[i], r[j]) {
      merged.append(l[i])
      i += 1
    } else {
      merged.append(r[j])
      j += 1
    }
  }
  return merged
}


// Quick Sort
// * Quick Sort (Does not sort in-place)
// Space Complexity: O(n) -> Your implementation should be O(1) (which means you're not supposed to create new arrays)

// * Quick Sort (sorts in-place)
// Time Complexity: O(N lgN) -> technically O(N^2) in the worst case
// Space Complexity: O(1)
func quickSort<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) -> [T]{
    guard start >= 0 && end < arr.count && end - start >= 1 else { return arr }
   //quickSort(&arr, start, partition(&arr, start,end) - 1)
   quickSort(&arr, partition(&arr, start,end) + 1, end)
return arr
}

/// Returns the index of the pivot
/// - Parameters:
///   - arr: the array
///   - start: the start index
///   - end: the end index
/// - Returns: the index of the pivot after partitioning
func partition<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) -> Int {
 
    var left = start, right = end
    let standard = arr[start]
    
    while left != right {
        while arr[right] >= standard  && left < right { right -= 1 }
        while arr[left] <= standard && left < right { left += 1 }
        if left < right {
            arr.swapAt(left, right)
        }
    }
    arr[start] = arr[left]
    arr[left] = standard
    return left
}

