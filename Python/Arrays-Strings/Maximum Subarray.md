# Maximum Subarray

## Problem Statement
Given an integer array `nums`, find the subarray with the largest sum, and return its sum.

**Example:**
- Input: `nums = [-2,1,-3,4,-1,2,1,-5,4]`
- Output: `6`
- Explanation: [4,-1,2,1] has the largest sum 6

## Approach
Use Kadane's algorithm. For each position, decide whether to start a new subarray or extend the existing one. Track the maximum sum seen so far.

- **Time Complexity:** O(n)
- **Space Complexity:** O(1)

## Solution

```python
class Solution:
    def maxSubArray(self, nums: list[int]) -> int:
        cur_sum = nums[0]
        max_sum = nums[0]
        
        for num in nums[1:]:
            cur_sum = max(num, cur_sum + num)
            max_sum = max(max_sum, cur_sum)
        
        return max_sum
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]) == 6

# Test 2
assert sol.maxSubArray([1]) == 1

# Test 3
assert sol.maxSubArray([-1]) == -1
```

