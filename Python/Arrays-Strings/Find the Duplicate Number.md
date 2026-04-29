# Find the Duplicate Number

## Problem Statement
Given an array of integers `nums` containing n + 1 integers where each integer is in the range [1, n] inclusive. There is only one repeated number in `nums`, return this repeated number. You must solve the problem without modifying the array and using only constant extra space.

**Example:**
- Input: `nums = [1,3,4,2,2]`
- Output: `2`

## Approach
Use Floyd's Cycle Detection Algorithm (tortoise and hare). Treat the array as a linked list where `nums[i]` points to index `nums[i]`. Find the cycle and return the start of the cycle, which is the duplicate number.

- **Time Complexity:** O(n)
- **Space Complexity:** O(1)

## Solution

```python
class Solution:
    def findDuplicate(self, nums: list[int]) -> int:
        slow = fast = nums[0]
        
        # Phase 1: Find intersection point in cycle
        while True:
            slow = nums[slow]
            fast = nums[nums[fast]]
            if slow == fast:
                break
        
        # Phase 2: Find cycle start
        slow = nums[0]
        while slow != fast:
            slow = nums[slow]
            fast = nums[fast]
        
        return slow
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.findDuplicate([1,3,4,2,2]) == 2

# Test 2
assert sol.findDuplicate([3,1,3,4,2]) == 3
```

