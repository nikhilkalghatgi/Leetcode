# Rotate Array

## Problem Statement
Given an integer array `nums`, rotate the array to the right by `k` steps, where `k` is non-negative.

**Example:**
- Input: `nums = [1,2,3,4,5,6,7], k = 3`
- Output: `[5,6,7,1,2,3,4]`

## Approach
Use the reverse algorithm. Reverse the entire array, then reverse the first k elements, then reverse the remaining elements. This achieves rotation in O(n) time with O(1) space.

- **Time Complexity:** O(n)
- **Space Complexity:** O(1)

## Solution

```python
class Solution:
    def rotate(self, nums: list[int], k: int) -> None:
        def reverse(arr, start, end):
            while start < end:
                arr[start], arr[end] = arr[end], arr[start]
                start += 1
                end -= 1
        
        n = len(nums)
        k = k % n
        
        reverse(nums, 0, n - 1)
        reverse(nums, 0, k - 1)
        reverse(nums, k, n - 1)
```

## Test Cases

```python
# Test 1
sol = Solution()
nums = [1,2,3,4,5,6,7]
sol.rotate(nums, 3)
assert nums == [5,6,7,1,2,3,4]

# Test 2
nums = [-1,-100,3,99]
sol.rotate(nums, 2)
assert nums == [3,99,-1,-100]
```

