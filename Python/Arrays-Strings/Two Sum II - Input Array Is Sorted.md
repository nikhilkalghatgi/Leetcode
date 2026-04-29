# Two Sum II - Input Array Is Sorted

## Problem Statement
Given a 1-indexed array of integers `numbers` that is already sorted in non-decreasing order, find two numbers such that they add up to a specific `target` number. Return the indices of the two numbers `[index1, index2]` where 1 <= index1 < index2 <= numbers.length. The tests are generated such that there is exactly one solution. You must use only constant extra space.

**Example:**
- Input: `numbers = [2,7,11,15], target = 9`
- Output: `[1,2]`
- Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2]

## Approach
Use two pointers, one at the start and one at the end. If the sum is too small, move the left pointer right. If the sum is too large, move the right pointer left. When sum equals target, return the indices (1-indexed).

- **Time Complexity:** O(n)
- **Space Complexity:** O(1)

## Solution

```python
class Solution:
    def twoSum(self, numbers: list[int], target: int) -> list[int]:
        left = 0
        right = len(numbers) - 1
        
        while left < right:
            current_sum = numbers[left] + numbers[right]
            if current_sum == target:
                return [left + 1, right + 1]
            elif current_sum < target:
                left += 1
            else:
                right -= 1
        
        return []
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.twoSum([2,7,11,15], 9) == [1,2]

# Test 2
assert sol.twoSum([2,3,4], 6) == [1,3]

# Test 3
assert sol.twoSum([-1,0], -1) == [1,2]
```

