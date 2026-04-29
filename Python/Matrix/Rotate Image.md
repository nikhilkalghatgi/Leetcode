# Rotate Image

## Problem Statement
You are given an n x n 2D `matrix` representing an image, rotate the image by 90 degrees (clockwise). You must rotate the image in-place.

**Example:**
- Input: `matrix = [[1,2,3],[4,5,6],[7,8,9]]`
- Output: `[[7,4,1],[8,5,2],[9,6,3]]`

## Approach
First transpose the matrix (swap elements across diagonal), then reverse each row. This achieves 90-degree clockwise rotation in O(1) extra space.

- **Time Complexity:** O(n²)
- **Space Complexity:** O(1)

## Solution

```python
class Solution:
    def rotate(self, matrix: list[list[int]]) -> None:
        n = len(matrix)
        
        for i in range(n):
            for j in range(i + 1, n):
                matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
        
        for i in range(n):
            matrix[i].reverse()
```

## Test Cases

```python
# Test 1
sol = Solution()
matrix = [[1,2,3],[4,5,6],[7,8,9]]
sol.rotate(matrix)
assert matrix == [[7,4,1],[8,5,2],[9,6,3]]

# Test 2
matrix = [[5,1],[2,3]]
sol.rotate(matrix)
assert matrix == [[2,5],[3,1]]

# Test 3
matrix = [[1]]
sol.rotate(matrix)
assert matrix == [[1]]
```

