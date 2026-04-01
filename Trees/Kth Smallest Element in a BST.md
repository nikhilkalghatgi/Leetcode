Given the root of a binary search tree, and an integer k, return the kth smallest value (1-indexed) of all the values of the nodes in the tree.


```cpp
class Solution {
public:
    int count = 0;
    int ans = -1;

    void inorder(TreeNode* root, int k) {
        if (!root) return;

        inorder(root->left, k);

        count++;
        if (count == k) {
            ans = root->val;
            return;
        }

        inorder(root->right, k);
    }

    int kthSmallest(TreeNode* root, int k) {
        inorder(root, k);
        return ans;
    }
};
```