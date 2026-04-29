# Binary Tree Inorder Traversal

## Problem Statement
Given the root of a binary tree, return the inorder traversal of its nodes' values. Inorder traversal means: Left subtree → Current node → Right subtree.

**Example:**
- Input: `root = [1,null,2,3]`
- Output: `[1,3,2]`

## Approach
Use recursion. Visit left subtree first, then process current node, then visit right subtree.

- **Time Complexity:** O(n)
- **Space Complexity:** O(h) where h is height (recursion stack)

## Solution

```python
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution:
    def inorderTraversal(self, root: TreeNode) -> list[int]:
        result = []
        
        def inorder(node):
            if not node:
                return
            inorder(node.left)
            result.append(node.val)
            inorder(node.right)
        
        inorder(root)
        return result
```

## Test Cases

```python
# Test 1
sol = Solution()
root = TreeNode(1, None, TreeNode(2, TreeNode(3)))
assert sol.inorderTraversal(root) == [1, 3, 2]

# Test 2
root = None
assert sol.inorderTraversal(root) == []

# Test 3
root = TreeNode(1)
assert sol.inorderTraversal(root) == [1]
```

