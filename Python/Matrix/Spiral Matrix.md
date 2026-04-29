# Spiral Matrix

## Problem Statement
Given an m x n `matrix`, return all elements of the matrix in spiral order (clockwise: right, down, left, up).

**Example:**
- Input: `matrix = [[1,2,3],[4,5,6],[7,8,9]]`
- Output: `[1,2,3,6,9,8,7,4,5]`

## Approach
Use four boundaries: top, bottom, left, right. Traverse in spiral order while contracting boundaries after each direction.

- **Time Complexity:** O(m * n)
- **Space Complexity:** O(1) excluding output

## Solution

```python
class Solution:
    def spiralOrder(self, matrix: list[list[int]]) -> list[int]:
        if not matrix:
            return []
        
        m, n = len(matrix), len(matrix[0])
        top, bottom, left, right = 0, m - 1, 0, n - 1
        result = []
        
        while top <= bottom and left <= right:
            for col in range(left, right + 1):
                result.append(matrix[top][col])
            top += 1
            
            for row in range(top, bottom + 1):
                result.append(matrix[row][right])
            right -= 1
            
            if top <= bottom:
                for col in range(right, left - 1, -1):
                    result.append(matrix[bottom][col])
                bottom -= 1
            
            if left <= right:
                for row in range(bottom, top - 1, -1):
                    result.append(matrix[row][left])
                left += 1
        
        return result
```

## Test Cases

```python
# Test 1
sol = Solution()
matrix = [[1,2,3],[4,5,6],[7,8,9]]
assert sol.spiralOrder(matrix) == [1,2,3,6,9,8,7,4,5]

# Test 2
matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
assert sol.spiralOrder(matrix) == [1,2,3,4,8,12,11,10,9,5,6,7]

# Test 3
matrix = [[1]]
assert sol.spiralOrder(matrix) == [1]
```

