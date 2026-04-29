# Swap Nodes in Pairs

## Problem Statement
Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (only nodes themselves may be changed).

**Example:**
- Input: head = [1,2,3,4]
- Output: [2,1,4,3]

## Approach
Use recursion. Swap the first two nodes and recursively swap the rest of the list. The first node's next should point to the result of the recursive call on the node after the second node.

- **Time Complexity:** O(n)
- **Space Complexity:** O(n) for recursion stack

## Solution

```python
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def swapPairs(self, head: ListNode) -> ListNode:
        if not head or not head.next:
            return head
        
        first = head
        second = head.next
        
        first.next = self.swapPairs(second.next)
        second.next = first
        
        return second
```

## Test Cases

```python
# Test 1
sol = Solution()
head = ListNode(1, ListNode(2, ListNode(3, ListNode(4))))
result = sol.swapPairs(head)
# Result: 2 -> 1 -> 4 -> 3
assert result.val == 2
assert result.next.val == 1
assert result.next.next.val == 4

# Test 2
head = ListNode(1)
result = sol.swapPairs(head)
assert result.val == 1

# Test 3
head = None
result = sol.swapPairs(head)
assert result is None

# Test 4
head = ListNode(1, ListNode(2))
result = sol.swapPairs(head)
assert result.val == 2
assert result.next.val == 1
```

