# Valid Parentheses

## Problem Statement
Given a string `s` containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid. An input string is valid if:
1. Open brackets must be closed by the same type of brackets.
2. Open brackets must be closed in the correct order.
3. Every close bracket has a corresponding open bracket of the same type.

**Example:**
- Input: `s = "()"`
- Output: `true`

## Approach
Use a stack. Push opening brackets onto the stack. For each closing bracket, check if it matches the top of the stack. If yes, pop the stack. If no, return false. At the end, the stack should be empty.

- **Time Complexity:** O(n)
- **Space Complexity:** O(n)

## Solution

```python
class Solution:
    def isValid(self, s: str) -> bool:
        stack = []
        pairs = {'(': ')', '{': '}', '[': ']'}
        
        for c in s:
            if c in pairs:
                stack.append(c)
            else:
                if not stack or pairs[stack.pop()] != c:
                    return False
        
        return len(stack) == 0
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.isValid("()") == True

# Test 2
assert sol.isValid("()[]{}") == True

# Test 3
assert sol.isValid("(]") == False

# Test 4
assert sol.isValid("[") == False

# Test 5
assert sol.isValid("") == True

# Test 6
assert sol.isValid("([{}])") == True
```

