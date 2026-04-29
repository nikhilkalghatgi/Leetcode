# Set Matrix Zeroes

## Problem Statement
Given an m x n integer `matrix`, if an element is 0, set its entire row and column to 0's in place.

**Example:**
- Input: `matrix = [[1,1,1],[1,0,1],[1,1,1]]`
- Output: `[[1,0,1],[0,0,0],[1,0,1]]`

## Approach
First pass: identify all rows and columns that need to be zeroed. Second pass: set the identified rows and columns to 0. This ensures we don't mark cells as zero prematurely.

- **Time Complexity:** O(m * n)
- **Space Complexity:** O(m + n)

## Solution

```python
class Solution:
    def setZeroes(self, matrix: list[list[int]]) -> None:
        m, n = len(matrix), len(matrix[0])
        rows, cols = set(), set()
        
        for i in range(m):
            for j in range(n):
                if matrix[i][j] == 0:
                    rows.add(i)
                    cols.add(j)
        
        for i in range(m):
            for j in range(n):
                if i in rows or j in cols:
                    matrix[i][j] = 0
```

## Test Cases

```python
# Test 1
sol = Solution()
matrix = [[1,1,1],[1,0,1],[1,1,1]]
sol.setZeroes(matrix)
assert matrix == [[1,0,1],[0,0,0],[1,0,1]]

# Test 2
matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
sol.setZeroes(matrix)
assert matrix == [[0,0,0,0],[0,4,5,0],[0,3,1,0]]

# Test 3
matrix = [[1,1,1],[1,1,1],[1,1,1]]
sol.setZeroes(matrix)
assert matrix == [[1,1,1],[1,1,1],[1,1,1]]
```

