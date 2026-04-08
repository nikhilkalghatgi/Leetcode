Given an integer array nums, find a subarray that has the largest product, and return the product.

The test cases are generated so that the answer will fit in a 32-bit integer.

Note that the product of an array with a single element is the value of that element.

Example 1:

Input: nums = [2,3,-2,4]
Output: 6
Explanation: [2,3] has the largest product 6.
Example 2:

Input: nums = [-2,0,-1]
Output: 0
Explanation: The result cannot be 2, because [-2,-1] is not a subarray

```cpp
class Solution {
public:
    int maxProduct(vector<int>& nums) {
        int maxProd = nums[0];
        int curMax = nums[0];
        int curMin = nums[0];
        

        for(int i=1; i<nums.size(); i++){
            int temp = curMax;
            curMax = max({nums[i], nums[i]*curMax, nums[i]*curMin});
            curMin = min({nums[i], nums[i]*curMin, nums[i]*temp});
            maxProd = max(maxProd, curMax);
        }
        return maxProd;
    }   
};

```