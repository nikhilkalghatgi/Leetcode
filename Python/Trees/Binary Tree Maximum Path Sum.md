# Binary Tree Maximum Path Sum

## Problem Statement
A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence at most once. The path does not need to pass through the root. The path sum of a path is the sum of the node's values in the path. Given the root of a binary tree, return the maximum path sum of any non-empty path.

**Example:**
- Input: `root = [1,2,3]`
- Output: `6`
- Explanation: The path [2,1,3] gives sum 6

## Approach
Use DFS. For each node, compute the maximum path sum passing through it. Return the maximum value extending downward to its parent. Track the global maximum.

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
    def maxPathSum(self, root: TreeNode) -> int:
        self.max_sum = float('-inf')
        
        def dfs(node):
            if not node:
                return 0
            
            left = max(0, dfs(node.left))
            right = max(0, dfs(node.right))
            
            self.max_sum = max(self.max_sum, left + right + node.val)
            
            return node.val + max(left, right)
        
        dfs(root)
        return self.max_sum
```

## Test Cases

```python
# Test 1
sol = Solution()
root = TreeNode(1, TreeNode(2), TreeNode(3))
assert sol.maxPathSum(root) == 6

# Test 2
root = TreeNode(-10, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
assert sol.maxPathSum(root) == 42

# Test 3
root = TreeNode(1)
assert sol.maxPathSum(root) == 1

# Test 4
root = TreeNode(-3)
assert sol.maxPathSum(root) == -3
```

