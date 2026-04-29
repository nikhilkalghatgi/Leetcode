# Validate Binary Search Tree

## Problem Statement
Given the root of a binary tree, determine if it is a valid binary search tree (BST).

A valid BST is defined as follows:
1. The left subtree of a node contains only nodes with keys strictly less than the node's key.
2. The right subtree of a node contains only nodes with keys strictly greater than the node's key.
3. Both the left and right subtrees must also be binary search trees.

**Example:**
- Input: `root = [2,1,3]`
- Output: `true`

## Approach
Use inorder traversal. In a valid BST, inorder traversal produces strictly increasing values. Track the previous value and check if current value is greater.

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
    def isValidBST(self, root: TreeNode) -> bool:
        self.prev = None
        return self.inorder(root)
    
    def inorder(self, node):
        if not node:
            return True
        
        if not self.inorder(node.left):
            return False
        
        if self.prev is not None and node.val <= self.prev:
            return False
        
        self.prev = node.val
        
        return self.inorder(node.right)
```

## Test Cases

```python
# Test 1: Valid BST
sol = Solution()
root = TreeNode(2, TreeNode(1), TreeNode(3))
assert sol.isValidBST(root) == True

# Test 2: Invalid BST
root = TreeNode(5)
root.left = TreeNode(1)
root.right = TreeNode(4)
root.right.left = TreeNode(3)
root.right.right = TreeNode(6)
assert sol.isValidBST(root) == False

# Test 3: Single node
root = TreeNode(1)
assert sol.isValidBST(root) == True

# Test 4: All left children
root = TreeNode(1, TreeNode(0))
assert sol.isValidBST(root) == True
```

