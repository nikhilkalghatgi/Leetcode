Given the root of a binary tree, determine if it is a valid binary search tree (BST).

A valid BST is defined as follows:

The left subtree of a node contains only nodes with keys strictly less than the node's key.
The right subtree of a node contains only nodes with keys strictly greater than the node's key.
Both the left and right subtrees must also be binary search trees.

SOLUTION 1:
```cpp
class Solution{
    bool dfs(TreeNode* root, minVal, maxVal){
        if(!root) return true;

        if(root->val < minVal && root->val > maxVal) return false;
        
        return dfs(root->left, minVal, root->val) &&
               dfs(root->right, root->val, maxVal);

    }

    bool isValidBST(TreeNode* root) {
        return dfs(root, INT_MIN, INT_MAX);
    }
}
```

```cpp
class Solution {
public:

    TreeNode* prev = nullptr;
    bool inorder(TreeNode* root){
        
        if (!root) return true;
        if (!inorder(root->left)) return false;
        if (prev && root->val <= prev->val) return false;
        prev = root;
        return inorder(root->right);
    }
    bool isValidBST(TreeNode* root) {
        return inorder(root);

    }
};
```