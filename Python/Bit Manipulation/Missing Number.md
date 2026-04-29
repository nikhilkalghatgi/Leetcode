# Missing Number

## Problem Statement
Given an array `nums` containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

**Example:**
- Input: `nums = [3,0,1]`
- Output: `2`
- Explanation: n = 3, so all numbers are in range [0,3]. 2 is the missing number

## Approach
Use XOR operation. XOR all numbers from 0 to n and XOR all numbers in the array. All duplicates cancel out, leaving only the missing number.

- **Time Complexity:** O(n)
- **Space Complexity:** O(1)

## Solution

```python
class Solution:
    def missingNumber(self, nums: list[int]) -> int:
        xor_all = 0
        xor_nums = 0
        
        for i in range(len(nums) + 1):
            xor_all ^= i
        
        for num in nums:
            xor_nums ^= num
        
        return xor_all ^ xor_nums
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.missingNumber([3,0,1]) == 2

# Test 2
assert sol.missingNumber([0,1]) == 2

# Test 3
assert sol.missingNumber([9,6,4,2,3,5,7,0,1]) == 8
```

