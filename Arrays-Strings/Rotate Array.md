Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.
✅ Optimal Solution (O(n) time, O(1) space)
🔥 Reverse Trick
```cpp
#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
    void rotate(vector<int>& nums, int k) {
        int n = nums.size();
        k = k % n;  // important if k > n

        reverse(nums.begin(), nums.end());             // Step 1
        reverse(nums.begin(), nums.begin() + k);       // Step 2
        reverse(nums.begin() + k, nums.end());         // Step 3
    }
};
```
🧠 Why This Works (Very Important)

Example:

nums = [1,2,3,4,5,6,7]
k = 3


We want:

[5,6,7,1,2,3,4]

Step 1: Reverse Entire Array
[7,6,5,4,3,2,1]

Step 2: Reverse First k Elements
[5,6,7,4,3,2,1]

Step 3: Reverse Remaining Elements
[5,6,7,1,2,3,4]