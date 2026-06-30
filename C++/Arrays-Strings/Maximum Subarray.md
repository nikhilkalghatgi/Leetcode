Given an integer array nums, find the contiguous subarray with the largest sum and return that sum.

Example
Input:  [-2,1,-3,4,-1,2,1,-5,4]
Output: 6

Explanation:
Subarray = [4,-1,2,1]
Sum = 6

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
