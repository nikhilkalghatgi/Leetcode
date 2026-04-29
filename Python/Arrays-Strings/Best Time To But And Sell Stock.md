# Best Time to Buy and Sell Stock

## Problem Statement
You are given an array `prices` where `prices[i]` is the price of a given stock on the ith day. You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock. Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

**Example:**
- Input: `prices = [7,1,5,3,6,4]`
- Output: `5`
- Explanation: Buy at 1 and sell at 6, profit = 6-1 = 5

## Approach
Keep track of the minimum price seen so far. For each price, calculate the profit if we sell at that price. Update the maximum profit accordingly.

- **Time Complexity:** O(n)
- **Space Complexity:** O(1)

## Solution

```python
class Solution:
    def maxProfit(self, prices: list[int]) -> int:
        min_price = prices[0]
        max_profit = 0
        
        for price in prices[1:]:
            if price < min_price:
                min_price = price
            else:
                max_profit = max(max_profit, price - min_price)
        
        return max_profit
```

## Test Cases

```python
# Test 1
sol = Solution()
assert sol.maxProfit([7,1,5,3,6,4]) == 5

# Test 2
assert sol.maxProfit([7,6,4,3,1]) == 0
```

