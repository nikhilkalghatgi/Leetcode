Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).


🌳 Example
        3
       / \
      9  20
         / \
        15  7
📊 Output
[
  [3],
  [9, 20],
  [15, 7]
]
🧠 Intuition

At any moment:

Queue contains nodes of the current level
Process all of them → push their children → move to next level


```cpp
class Solution {
public:
    vector<vector<int>> levelOrder(TreeNode* root) {
        vector<vector<int>> result;
        if (!root) return result;
        queue<TreeNode*> q;
        q.push(root);
        
        while(!q.empty()){
            vector<int> level;
            int size = q.size();
            for(int i=0; i<size; i++){
                TreeNode* node = q.front();
                q.pop();
                level.push_back(node->val);  // [3]
                if(node->left) q.push(node->left);
                if(node->right) q.push(node->right);

            }
            result.push_back(level);
        }
        return result;
    }
};
```