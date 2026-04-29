# Number of 1 Bits

## Problem Statement
Given a positive integer `n`, write a function that returns the number of set bits in its binary representation (also known as the Hamming weight).

**Example:**
- Input: `n = 11`
- Output: `3`
- Explanation: The input binary string is "1011", which has three set bits

## Approach
Use bitwise AND with 1 to check the least significant bit. Right shift the number and repeat until the number becomes 0. Count the set bits encountered.

- **Time Complexity:** O(log n) or O(number of bits)
- **Space Complexity:** O(1)

## Solution

```python
class Solution:
    def hammingWeight(self, n: int) -> int:
        count = 0
        while n:
            count += n & 1
            n >>= 1
        return count
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.hammingWeight(11) == 3  # 1011

# Test 2
assert sol.hammingWeight(128) == 1  # 10000000

# Test 3
assert sol.hammingWeight(2147483645) == 30
```

