# Longest Substring Without Repeating Characters

## Problem Statement
Given a string `s`, find the length of the longest substring without repeating characters.

**Example:**
- Input: `s = "abcabcbb"`
- Output: `3`
- Explanation: The answer is "abc", which has length 3

## Approach
Use a sliding window with a hash map to track the most recent index of each character. When a duplicate is found, move the left pointer to the right of the previous occurrence.

- **Time Complexity:** O(n)
- **Space Complexity:** O(min(m, n)) where m is charset size

## Solution

```python
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        char_index = {}
        max_len = 0
        left = 0
        
        for right in range(len(s)):
            if s[right] in char_index and char_index[s[right]] >= left:
                left = char_index[s[right]] + 1
            
            char_index[s[right]] = right
            max_len = max(max_len, right - left + 1)
        
        return max_len
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.lengthOfLongestSubstring("abcabcbb") == 3

# Test 2
assert sol.lengthOfLongestSubstring("bbbbb") == 1

# Test 3
assert sol.lengthOfLongestSubstring("pwwkew") == 3
```

