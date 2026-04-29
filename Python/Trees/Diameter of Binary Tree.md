# Diameter of Binary Tree

## Problem Statement
Given the root of a binary tree, return the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root. The length of a path between two nodes is represented by the number of edges between them.

**Example:**
- Input: `root = [1,2,3,4,5]`
- Output: `3`
- Explanation: The longest path is [4,2,1,3] or [5,2,1,3]

## Approach
Use DFS. For each node, compute the height of left and right subtrees. The diameter passing through this node is the sum of left and right heights. Track the maximum diameter found.

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
    def diameterOfBinaryTree(self, root: TreeNode) -> int:
        self.diameter = 0
        
        def dfs(node):
            if not node:
                return 0
            
            left = dfs(node.left)
            right = dfs(node.right)
            
            self.diameter = max(self.diameter, left + right)
            
            return 1 + max(left, right)
        
        dfs(root)
        return self.diameter
```

## Test Cases

```python
# Test 1
sol = Solution()
root = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3))
assert sol.diameterOfBinaryTree(root) == 3

# Test 2
root = TreeNode(1, TreeNode(2))
assert sol.diameterOfBinaryTree(root) == 1

# Test 3
root = TreeNode(1)
assert sol.diameterOfBinaryTree(root) == 0
```

