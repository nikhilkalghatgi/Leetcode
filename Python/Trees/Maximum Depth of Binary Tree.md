# Maximum Depth of Binary Tree

## Problem Statement
Given the root of a binary tree, return its maximum depth. A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

**Example:**
- Input: `root = [3,9,20,null,null,15,7]`
- Output: `3`
- Explanation: The longest path is [3,20,7] with 3 nodes

## Approach
Use recursion. Base case: if node is null, return 0. Otherwise, return 1 plus the maximum depth of left and right subtrees.

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
    def maxDepth(self, root: TreeNode) -> int:
        if not root:
            return 0
        
        left = self.maxDepth(root.left)
        right = self.maxDepth(root.right)
        
        return 1 + max(left, right)
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
assert sol.maxDepth(root) == 3

# Test 2
root = TreeNode(1, None, TreeNode(2))
assert sol.maxDepth(root) == 2

# Test 3
root = None
assert sol.maxDepth(root) == 0

# Test 4
root = TreeNode(1)
assert sol.maxDepth(root) == 1
```

