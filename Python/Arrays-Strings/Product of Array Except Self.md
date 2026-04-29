# Product of Array Except Self

## Problem Statement
Given an integer array `nums`, return an array `answer` such that `answer[i]` is equal to the product of all the elements of `nums` except `nums[i]`. The product of any prefix or suffix of `nums` is guaranteed to fit in a 32-bit integer. You must write an algorithm that runs in O(n) time and without using the division operation.

**Example:**
- Input: `nums = [1,2,3,4]`
- Output: `[24,12,8,6]`

## Approach
Use prefix and suffix products. First pass: calculate prefix product for each position (product of all elements to the left). Second pass: calculate suffix product and multiply with prefix to get the result.

- **Time Complexity:** O(n)
- **Space Complexity:** O(1) excluding output array

## Solution

```python
class Solution:
    def productExceptSelf(self, nums: list[int]) -> list[int]:
        n = len(nums)
        result = [1] * n
        
        prefix = 1
        for i in range(n):
            result[i] = prefix
            prefix *= nums[i]
        
        suffix = 1
        for i in range(n - 1, -1, -1):
            result[i] *= suffix
            suffix *= nums[i]
        
        return result
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.productExceptSelf([1,2,3,4]) == [24,12,8,6]

# Test 2
assert sol.productExceptSelf([-1,1,0,-3,3]) == [0,0,9,0,0]
```

