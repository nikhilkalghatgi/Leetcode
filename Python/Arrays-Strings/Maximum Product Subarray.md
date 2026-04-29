# Maximum Product Subarray

## Problem Statement
Given an integer array `nums`, find a subarray that has the largest product, and return the product. The test cases are generated so that the answer will fit in a 32-bit integer.

**Example:**
- Input: `nums = [2,3,-2,4]`
- Output: `6`
- Explanation: [2,3] has the largest product 6

## Approach
Track both the maximum and minimum products ending at each position. When encountering a negative number, the minimum product might become the maximum (and vice versa). Use dynamic programming.

- **Time Complexity:** O(n)
- **Space Complexity:** O(1)

## Solution

```python
class Solution:
    def maxProduct(self, nums: list[int]) -> int:
        if not nums:
            return 0
        
        max_prod = nums[0]
        cur_max = nums[0]
        cur_min = nums[0]
        
        for num in nums[1:]:
            temp = cur_max
            cur_max = max(num, num * cur_max, num * cur_min)
            cur_min = min(num, num * cur_min, num * temp)
            max_prod = max(max_prod, cur_max)
        
        return max_prod
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.maxProduct([2,3,-2,4]) == 6

# Test 2
assert sol.maxProduct([-2,0,-1]) == 0

# Test 3
assert sol.maxProduct([-2]) == -2
```

