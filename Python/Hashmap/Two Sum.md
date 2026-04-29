# Two Sum

## Problem Statement
Given an array of integers `nums` and an integer `target`, return the indices of the two numbers such that they add up to `target`. You may assume that each input has exactly one solution, and you cannot use the same element twice. You can return the answer in any order.

**Example:**
- Input: `nums = [2,7,11,15], target = 9`
- Output: `[0,1]`
- Explanation: nums[0] + nums[1] == 9, so we return [0, 1]

## Approach
Use a hash map to store the value and its index. For each number, check if the complement (target - num) exists in the hash map. If yes, return both indices. Otherwise, add the current number to the hash map.

- **Time Complexity:** O(n)
- **Space Complexity:** O(n)

## Solution

```python
class Solution:
    def twoSum(self, nums: list[int], target: int) -> list[int]:
        mp = {}
        
        for i, num in enumerate(nums):
            complement = target - num
            if complement in mp:
                return [mp[complement], i]
            mp[num] = i
        
        return []
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.twoSum([2,7,11,15], 9) == [0,1]

# Test 2
assert sol.twoSum([3,2,4], 6) == [1,2]

# Test 3
assert sol.twoSum([3,3], 6) == [0,1]
```

