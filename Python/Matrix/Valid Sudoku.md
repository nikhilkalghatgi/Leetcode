# Valid Sudoku

## Problem Statement
Determine if a 9 x 9 Sudoku `board` is valid. Only the filled cells need to be validated according to the following rules:
1. Each row must not contain duplicates of the digits 1-9.
2. Each column must not contain duplicates of the digits 1-9.
3. Each of the nine 3 x 3 sub-boxes must not contain duplicates of the digits 1-9.

Note: A Sudoku board (partially filled) could be valid but is not necessarily solvable.

**Example:**
- A partially filled board can be valid

## Approach
Track which digits we've seen in each row, column, and 3x3 box using sets. For each cell with a digit, check if it's already in the corresponding row, column, or box set. If yes, return false. Otherwise, add it to all three sets.

- **Time Complexity:** O(1) - fixed 9x9 board
- **Space Complexity:** O(1) - fixed board size

## Solution

```python
class Solution:
    def isValidSudoku(self, board: list[list[str]]) -> bool:
        rows = [set() for _ in range(9)]
        cols = [set() for _ in range(9)]
        boxes = [set() for _ in range(9)]
        
        for r in range(9):
            for c in range(9):
                val = board[r][c]
                if val == '.':
                    continue
                
                box = (r // 3) * 3 + (c // 3)
                
                if val in rows[r] or val in cols[c] or val in boxes[box]:
                    return False
                
                rows[r].add(val)
                cols[c].add(val)
                boxes[box].add(val)
        
        return True
```

## Test Cases

```python
# Test 1: Valid Sudoku board (partial)
sol = Solution()
board = [
    ["5","3",".",".","7",".",".",".","."],
    ["6",".",".","1","9","5",".",".","."],
    [".","9","8",".",".",".",".","6","."],
    ["8",".",".",".","6",".",".",".","3"],
    ["4",".",".","8",".","3",".",".","1"],
    ["7",".",".",".","2",".",".",".","6"],
    [".","6",".",".",".",".","2","8","."],
    [".",".",".","4","1","9",".",".","5"],
    [".",".",".",".","8",".",".","7","9"]
]
assert sol.isValidSudoku(board) == True

# Test 2: Invalid - duplicate in row
board = [
    ["8","3",".",".","7",".",".",".","."],
    ["6",".",".","1","9","5",".",".","."],
    [".","9","8",".",".",".",".","6","."],
    ["8",".",".",".","6",".",".",".","3"],
    ["4",".",".","8",".","3",".",".","1"],
    ["7",".",".",".","2",".",".",".","6"],
    [".","6",".",".",".",".","2","8","."],
    [".",".",".","4","1","9",".",".","5"],
    [".",".",".",".","8",".",".","7","9"]
]
assert sol.isValidSudoku(board) == False
```

