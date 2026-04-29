# Maximum Average Subarray I

## Problem Statement
You are given an integer array `nums` consisting of n elements, and an integer `k`. Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10^-5 will be accepted.

**Example:**
- Input: `nums = [1,12,-5,-6,50,3], k = 4`
- Output: `12.75`
- Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75

## Approach
Use a sliding window approach. Calculate the sum of the first k elements, then slide the window by removing the leftmost element and adding the next element. Track the maximum sum and return it divided by k.

- **Time Complexity:** O(n)
- **Space Complexity:** O(1)

## Solution

```python
class Solution:
    def findMaxAverage(self, nums: list[int], k: int) -> float:
        window_sum = sum(nums[:k])
        max_sum = window_sum
        
        for i in range(k, len(nums)):
            window_sum += nums[i] - nums[i - k]
            max_sum = max(max_sum, window_sum)
        
        return max_sum / k
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.findMaxAverage([1,12,-5,-6,50,3], 4) == 12.75

# Test 2
assert abs(sol.findMaxAverage([5], 1) - 5.0) < 1e-5

# Test 3
assert sol.findMaxAverage([0,4,0,3,2], 1) == 4.0
```

