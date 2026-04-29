# Path Sum

## Problem Statement
Given the root of a binary tree and an integer `targetSum`, return `true` if the tree has a root-to-leaf path such that adding up all the values along the path equals `targetSum`. A leaf is a node with no children.

**Example:**
- Input: `root = [5,4,8,11,null,13,4,7,2,null,1], targetSum = 22`
- Output: `true`
- Explanation: The root-to-leaf path [5,4,11,2] sums to 22

## Approach
Use DFS. At each node, subtract the node's value from targetSum. If we reach a leaf with remaining sum equal to node value, a path exists. Recursively check left and right subtrees.

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
    def hasPathSum(self, root: TreeNode, targetSum: int) -> bool:
        if not root:
            return False
        
        if not root.left and not root.right:
            return targetSum == root.val
        
        rem = targetSum - root.val
        return self.hasPathSum(root.left, rem) or self.hasPathSum(root.right, rem)
```

## Test Cases

```python
# Test 1
sol = Solution()
root = TreeNode(5)
root.left = TreeNode(4)
root.right = TreeNode(8)
root.left.left = TreeNode(11)
root.left.left.left = TreeNode(7)
root.left.left.right = TreeNode(2)
root.right.left = TreeNode(13)
root.right.right = TreeNode(4)
root.right.right.right = TreeNode(1)
assert sol.hasPathSum(root, 22) == True

# Test 2
root = TreeNode(1, TreeNode(2), TreeNode(3))
assert sol.hasPathSum(root, 5) == False

# Test 3
root = TreeNode(1)
assert sol.hasPathSum(root, 1) == True
```

