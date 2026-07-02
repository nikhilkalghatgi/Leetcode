Given a string s, find the length of the longest substring without duplicate characters.

Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3. Note that "bca" and "cab" are also correct answers.

```cpp
class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        int maxlen = 0;
        int left = 0;
        std::vector<int> lastIdx(256,-1);
        for(int right=0; right<s.size();right++ ){
            char c = s[right];
            if (lastIdx[c]>=left){
                left = lastIdx[c] + 1; // move left ahead of last seen
            }
            lastIdx[c] = right;
            maxlen = std::max(maxlen, right-left+1);

        }
        return maxlen;
    }
};
```

## LOGIC:
- left and right are 2 pointers that will have indexes of start and end of a substring which do not contain duplicates
- right will move along string (only forward)
- left will take the position of last seen index of 'b' if 'b' is again at index position of right
- right - left will give length of substring
