Given an integer array nums, find the subarray with the largest sum, and return its sum.

```cpp
class Solution {
public:
    int maxSubArray(vector<int>& nums) {
        int curSum = nums[0];
        int maxSum = nums[0];

        for (int i=1; i<nums.size(); i++){
            curSum = std::max(nums[i], curSum+nums[i]);
            maxSum = std::max(maxSum, curSum);
        }
        return maxSum;
    }
};
```