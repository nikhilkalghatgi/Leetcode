# Trapping Rain Water

## Problem Statement
Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

**Example:**
- Input: `height = [0,1,0,2,1,0,1,3,2,1,2,1]`
- Output: `6`

## Approach
Use two pointers starting from both ends. Track the maximum height seen from left and right. Water trapped at each position is determined by the minimum of left and right max heights minus the current height. Move the pointer with the smaller height.

- **Time Complexity:** O(n)
- **Space Complexity:** O(1)

## Solution

```python
class Solution:
    def trap(self, height: list[int]) -> int:
        if not height:
            return 0
        
        left, right = 0, len(height) - 1
        left_max, right_max = 0, 0
        water = 0
        
        while left < right:
            if height[left] < height[right]:
                left_max = max(left_max, height[left])
                water += left_max - height[left]
                left += 1
            else:
                right_max = max(right_max, height[right])
                water += right_max - height[right]
                right -= 1
        
        return water
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.trap([0,1,0,2,1,0,1,3,2,1,2,1]) == 6

# Test 2
assert sol.trap([4,2,0,3,2,5]) == 9
```

