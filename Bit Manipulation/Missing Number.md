Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

Example 1:

Input: nums = [3,0,1]

Output: 2

```cpp
class Solution {
public:
    int missingNumber(vector<int>& nums) {
        int n = nums.size();
        int xorAll = 0, xorNums = 0;

        for(int i = 0; i <= n; i++) {
            xorAll ^= i;
        }

        for(int num : nums) {
            xorNums ^= num;
        }

        return xorAll ^ xorNums;
    }
};
```
Why This Works 🧠

Write everything together:

(0 ^ 1 ^ 2 ^ 3) ^ (3 ^ 0 ^ 1)

Rearrange:

= (0 ^ 0) ^ (1 ^ 1) ^ (3 ^ 3) ^ 2

Using XOR properties:

a ^ a = 0
0 ^ x = x

So:

= 0 ^ 0 ^ 0 ^ 2
= 2

👉 Everything cancels except the missing number