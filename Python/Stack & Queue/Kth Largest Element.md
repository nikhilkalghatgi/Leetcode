# Kth Largest Element

## Problem Statement
Given an integer array `nums` and an integer `k`, return the kth largest element in the array. Note that it is the kth largest element in the sorted order, not the kth distinct element.

**Example:**
- Input: `nums = [3,2,1,5,6,4], k = 2`
- Output: `5` (the 2nd largest element)

## Approach
Use a min-heap of size k. Iterate through all numbers, adding them to the heap. If the heap size exceeds k, pop the smallest element. The top of the heap will be the kth largest.

- **Time Complexity:** O(n log k)
- **Space Complexity:** O(k)

## Solution

```python
import heapq

class Solution:
    def findKthLargest(self, nums: list[int], k: int) -> int:
        min_heap = []
        
        for num in nums:
            heapq.heappush(min_heap, num)
            if len(min_heap) > k:
                heapq.heappop(min_heap)
        
        return min_heap[0]
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.findKthLargest([3,2,1,5,6,4], 2) == 5

# Test 2
assert sol.findKthLargest([3,2,3,1,2,4,5,5,6], 4) == 4

# Test 3
assert sol.findKthLargest([1], 1) == 1

# Test 4
assert sol.findKthLargest([99,99], 2) == 99
```

