# Binary Tree Level Order Traversal

## Problem Statement
Given the root of a binary tree, return the level order traversal of its nodes' values (i.e., from left to right, level by level).

**Example:**
- Input: `root = [3,9,20,null,null,15,7]`
- Output: `[[3],[9,20],[15,7]]`

## Approach
Use BFS with a queue. For each level, process all nodes currently in the queue and add their children for the next level.

- **Time Complexity:** O(n)
- **Space Complexity:** O(w) where w is maximum width

## Solution

```python
from collections import deque

class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution:
    def levelOrder(self, root: TreeNode) -> list[list[int]]:
        if not root:
            return []
        
        result = []
        queue = deque([root])
        
        while queue:
            level = []
            level_size = len(queue)
            
            for _ in range(level_size):
                node = queue.popleft()
                level.append(node.val)
                
                if node.left:
                    queue.append(node.left)
                if node.right:
                    queue.append(node.right)
            
            result.append(level)
        
        return result
```

## Test Cases

```python
# Test 1
sol = Solution()
root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.right.left = TreeNode(15)
root.right.right = TreeNode(7)
assert sol.levelOrder(root) == [[3], [9, 20], [15, 7]]

# Test 2
root = TreeNode(1)
assert sol.levelOrder(root) == [[1]]

# Test 3
root = None
assert sol.levelOrder(root) == []
```

