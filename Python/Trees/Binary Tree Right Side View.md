# Binary Tree Right Side View

## Problem Statement
Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

**Example:**
- Input: `root = [1,2,3,null,5,null,4]`
- Output: `[1,3,4]`

## Approach
Use DFS. Visit right child before left child. Record the value of the first (rightmost) node at each depth level.

- **Time Complexity:** O(n)
- **Space Complexity:** O(h)

## Solution

```python
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution:
    def rightSideView(self, root: TreeNode) -> list[int]:
        result = []
        
        def dfs(node, depth):
            if not node:
                return
            
            if depth == len(result):
                result.append(node.val)
            
            dfs(node.right, depth + 1)
            dfs(node.left, depth + 1)
        
        dfs(root, 0)
        return result
```

## Test Cases

```python
# Test 1
sol = Solution()
root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left.right = TreeNode(5)
root.right.right = TreeNode(4)
assert sol.rightSideView(root) == [1, 3, 4]

# Test 2
root = TreeNode(1, None, TreeNode(2))
assert sol.rightSideView(root) == [1, 2]

# Test 3
root = None
assert sol.rightSideView(root) == []
```

