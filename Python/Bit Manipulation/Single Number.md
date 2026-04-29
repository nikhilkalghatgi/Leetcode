# Single Number

## Problem Statement
Given a non-empty array of integers `nums`, every element appears twice except for one. Find that single one. You must implement a solution with linear runtime complexity and use only constant extra space.

**Example:**
- Input: `nums = [2,2,1]`
- Output: `1`

## Approach
Use XOR operation. XOR of two identical numbers is 0, and XOR of any number with 0 is the number itself. XOR all elements to get the single number.

- **Time Complexity:** O(n)
- **Space Complexity:** O(1)

## Solution

```python
class Solution:
    def singleNumber(self, nums: list[int]) -> int:
        result = 0
        for num in nums:
            result ^= num
        return result
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.singleNumber([2,2,1]) == 1

# Test 2
assert sol.singleNumber([4,1,2,1,2]) == 4

# Test 3
assert sol.singleNumber([1]) == 1
```

