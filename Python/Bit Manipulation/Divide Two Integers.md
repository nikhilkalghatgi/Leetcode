# Divide Two Integers

## Problem Statement
Given two integers `dividend` and `divisor`, divide two integers without using multiplication, division, and mod operator. The integer division should truncate toward zero. Return the quotient after dividing dividend by divisor.

**Example:**
- Input: `dividend = 10, divisor = 3`
- Output: `3`
- Explanation: 10/3 = 3.33333.. → truncate to 3

## Approach
Use bit shifting to repeatedly subtract multiples of the divisor. Build the quotient by checking how many times we can subtract (divisor << 1), (divisor << 2), etc. from the dividend.

- **Time Complexity:** O(log n)
- **Space Complexity:** O(1)

## Solution

```python
class Solution:
    def divide(self, dividend: int, divisor: int) -> int:
        INT_MIN, INT_MAX = -2**31, 2**31 - 1
        
        if dividend == 0:
            return 0
        
        negative = (dividend < 0) ^ (divisor < 0)
        dvd = abs(dividend)
        dvs = abs(divisor)
        
        quotient = 0
        while dvd >= dvs:
            temp = dvs
            multiple = 1
            while dvd >= (temp << 1):
                temp <<= 1
                multiple <<= 1
            
            quotient += multiple
            dvd -= temp
        
        result = -quotient if negative else quotient
        return max(INT_MIN, min(INT_MAX, result))
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.divide(10, 3) == 3

# Test 2
assert sol.divide(7, -3) == -2

# Test 3
assert sol.divide(-2147483648, -1) == 2147483647
```

