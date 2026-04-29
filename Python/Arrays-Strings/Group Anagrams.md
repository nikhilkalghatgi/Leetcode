# Group Anagrams

## Problem Statement
Given an array of strings `strs`, group the anagrams together. You can return the answer in any order.

**Example:**
- Input: `strs = ["eat","tea","tan","ate","nat","bat"]`
- Output: `[["bat"],["nat","tan"],["ate","eat","tea"]]`

## Approach
For each string, create a frequency count of characters and convert it to a hashable key. Use this key to group anagrams together in a dictionary.

- **Time Complexity:** O(n * k log k) where n is number of strings and k is max length
- **Space Complexity:** O(n * k)

## Solution

```python
class Solution:
    def groupAnagrams(self, strs: list[str]) -> list[list[str]]:
        from collections import defaultdict
        
        anagrams = defaultdict(list)
        
        for s in strs:
            freq = [0] * 26
            for c in s:
                freq[ord(c) - ord('a')] += 1
            
            key = tuple(freq)
            anagrams[key].append(s)
        
        return list(anagrams.values())
```

## Test Cases

```python
# Test 1
sol = Solution()
result = sol.groupAnagrams(["eat","tea","tan","ate","nat","bat"])
assert len(result) == 3
assert sorted(["eat","tea","ate"]) in [sorted(group) for group in result]

# Test 2
assert sol.groupAnagrams([""]) == [[""]]
```

