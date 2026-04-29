# Power of Two, Three, Four

## Problem Statement
Write functions to determine if a given positive integer is a power of 2, 3, or 4 respectively. A number is a power of k if it can be expressed as k^x where x is a non-negative integer.

**Examples:**
- isPowerOfTwo(1) → true (2^0)
- isPowerOfThree(27) → true (3^3)
- isPowerOfFour(64) → true (4^3)

## Approach
Use recursion. Base cases: if n <= 0 return false, if n == 1 return true. If n is not divisible by the base, return false. Otherwise, recursively check n/base.

- **Time Complexity:** O(log n)
- **Space Complexity:** O(log n) for recursion

## Solution

```python
class Solution:
    def isPowerOfTwo(self, n: int) -> bool:
        if n <= 0:
            return False
        if n == 1:
            return True
        if n % 2 != 0:
            return False
        return self.isPowerOfTwo(n // 2)
    
    def isPowerOfThree(self, n: int) -> bool:
        if n <= 0:
            return False
        if n == 1:
            return True
        if n % 3 != 0:
            return False
        return self.isPowerOfThree(n // 3)
    
    def isPowerOfFour(self, n: int) -> bool:
        if n <= 0:
            return False
        if n == 1:
            return True
        if n % 4 != 0:
            return False
        return self.isPowerOfFour(n // 4)
```

## Test Cases

```python
# Test 1: Power of Two
sol = Solution()
assert sol.isPowerOfTwo(1) == True
assert sol.isPowerOfTwo(16) == True
assert sol.isPowerOfTwo(3) == False

# Test 2: Power of Three
assert sol.isPowerOfThree(27) == True
assert sol.isPowerOfThree(0) == False
assert sol.isPowerOfThree(9) == True

# Test 3: Power of Four
assert sol.isPowerOfFour(1) == True
assert sol.isPowerOfFour(16) == True
assert sol.isPowerOfFour(5) == False
```

