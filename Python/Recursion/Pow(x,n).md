# Pow(x,n)

## Problem Statement
Implement `pow(x, n)`, which calculates x raised to the power n. Handle both positive and negative exponents. Work with floating-point numbers for x.

**Example:**
- Input: `x = 2.00000, n = 10`
- Output: `1024.00000`

## Approach
Use binary exponentiation. For even exponents, compute x^(n/2) and square it. For odd exponents, compute x^(n-1) and multiply by x. Handle negative exponents by taking reciprocal.

- **Time Complexity:** O(log n)
- **Space Complexity:** O(log n) for recursion stack

## Solution

```python
class Solution:
    def myPow(self, x: float, n: int) -> float:
        if n == 0:
            return 1.0
        
        if n < 0:
            return 1.0 / self.myPow(x, -n)
        
        half = self.myPow(x, n // 2)
        
        if n % 2 == 0:
            return half * half
        else:
            return half * half * x
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.myPow(2.00000, 10) == 1024.00000

# Test 2
assert abs(sol.myPow(2.10000, 3) - 9.261) < 1e-5

# Test 3
assert abs(sol.myPow(2.00000, -2) - 0.25) < 1e-5

# Test 4
assert abs(sol.myPow(1.00000, -2147483648) - 1.0) < 1e-5
```

