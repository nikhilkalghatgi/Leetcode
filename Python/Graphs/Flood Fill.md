# Flood Fill

## Problem Statement
An image is represented by an m x n integer grid `image` where `image[i][j]` represents the pixel value of the image. You are also given three integers `sr`, `sc`, and `newColor`. You should perform a flood fill on the image starting from the pixel `image[sr][sc]`. To perform a flood fill, consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel. After the fill, all of the above pixels have the new color.

**Example:**
- Input: `image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, newColor = 2`
- Output: `[[2,2,2],[2,2,0],[2,0,1]]`

## Approach
Use DFS to visit all connected pixels with the same original color. Change each visited pixel to the new color. Stop when reaching pixels of different colors or boundaries.

- **Time Complexity:** O(m * n)
- **Space Complexity:** O(m * n) for recursion stack

## Solution

```python
class Solution:
    def floodFill(self, image: list[list[int]], sr: int, sc: int, newColor: int) -> list[list[int]]:
        if image[sr][sc] == newColor:
            return image
        
        original_color = image[sr][sc]
        
        def dfs(r, c):
            if r < 0 or r >= len(image) or c < 0 or c >= len(image[0]):
                return
            if image[r][c] != original_color:
                return
            
            image[r][c] = newColor
            dfs(r + 1, c)
            dfs(r - 1, c)
            dfs(r, c + 1)
            dfs(r, c - 1)
        
        dfs(sr, sc)
        return image
```

## Test Cases

```python
# Test 1
sol = Solution()
image = [[1,1,1],[1,1,0],[1,0,1]]
result = sol.floodFill(image, 1, 1, 2)
assert result == [[2,2,2],[2,2,0],[2,0,1]]

# Test 2
image = [[0,0,0],[0,0,0]]
result = sol.floodFill(image, 0, 0, 2)
assert result == [[2,2,2],[2,2,2]]
```

