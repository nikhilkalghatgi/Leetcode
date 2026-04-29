# Kth Smallest Element in a BST

## Problem Statement
Given the root of a binary search tree, and an integer `k`, return the kth smallest value (1-indexed) of all the values of the nodes in the tree.

**Example:**
- Input: `root = [3,1,4,null,2], k = 1`
- Output: `1`

## Approach
Use inorder traversal (which gives elements in sorted order). Count elements as we traverse and return the kth element.

- **Time Complexity:** O(n) worst case, O(k) average if balanced
- **Space Complexity:** O(h)

## Solution

```python
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution:
    def kthSmallest(self, root: TreeNode, k: int) -> int:
        self.count = 0
        self.result = None
        
        def inorder(node):
            if not node or self.result is not None:
                return
            
            inorder(node.left)
            
            self.count += 1
            if self.count == k:
                self.result = node.val
                return
            
            inorder(node.right)
        
        inorder(root)
        return self.result
```

## Test Cases

```python
# Test 1
sol = Solution()
root = TreeNode(3)
root.left = TreeNode(1)
root.right = TreeNode(4)
root.left.right = TreeNode(2)
assert sol.kthSmallest(root, 1) == 1

# Test 2
assert sol.kthSmallest(root, 3) == 2

# Test 3
assert sol.kthSmallest(root, 4) == 3
```

