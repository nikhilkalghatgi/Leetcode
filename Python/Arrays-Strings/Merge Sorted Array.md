# Merge Sorted Array

## Problem Statement
You are given two integer arrays `nums1` and `nums2`, sorted in non-decreasing order, and two integers `m` and `n`, representing the number of valid elements in `nums1` and `nums2` respectively. Merge `nums2` into `nums1` as one sorted array. Do this in-place.

**Example:**
- Input: `nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3`
- Output: `[1,2,2,3,5,6]`

## Approach
Start from the end of both arrays and merge backward. This avoids overwriting elements in nums1. Place the larger element at the current position and move the corresponding pointer.

- **Time Complexity:** O(m + n)
- **Space Complexity:** O(1)

## Solution

```python
class Solution:
    def merge(self, nums1: list[int], m: int, nums2: list[int], n: int) -> None:
        i = m - 1
        j = n - 1
        k = m + n - 1
        
        while i >= 0 and j >= 0:
            if nums1[i] > nums2[j]:
                nums1[k] = nums1[i]
                i -= 1
            else:
                nums1[k] = nums2[j]
                j -= 1
            k -= 1
        
        while j >= 0:
            nums1[k] = nums2[j]
            j -= 1
            k -= 1
```

## Test Cases

```python
# Test 1
sol = Solution()
nums1 = [1,2,3,0,0,0]
sol.merge(nums1, 3, [2,5,6], 3)
assert nums1 == [1,2,2,3,5,6]

# Test 2
nums1 = [1]
sol.merge(nums1, 1, [], 0)
assert nums1 == [1]
```

