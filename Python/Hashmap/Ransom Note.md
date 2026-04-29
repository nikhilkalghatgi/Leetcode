# Ransom Note

## Problem Statement
Given two strings `ransomNote` and `magazine`, return `true` if `ransomNote` can be constructed by using the letters from `magazine` and `false` otherwise. Each letter in `magazine` can only be used once in `ransomNote`.

**Example:**
- Input: `ransomNote = "a", magazine = "b"`
- Output: `false`

## Approach
Count the frequency of characters in the magazine. For each character in ransomNote, check if it's available and decrement its count. If any character is unavailable or exhausted, return false.

- **Time Complexity:** O(m + n) where m is len(ransomNote) and n is len(magazine)
- **Space Complexity:** O(1) - fixed alphabet size

## Solution

```python
class Solution:
    def canConstruct(self, ransomNote: str, magazine: str) -> bool:
        freq = {}
        
        for c in magazine:
            freq[c] = freq.get(c, 0) + 1
        
        for c in ransomNote:
            if c not in freq or freq[c] == 0:
                return False
            freq[c] -= 1
        
        return True
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.canConstruct("a", "b") == False

# Test 2
assert sol.canConstruct("a", "a") == True

# Test 3
assert sol.canConstruct("aa", "ab") == False

# Test 4
assert sol.canConstruct("aa", "aab") == True
```

