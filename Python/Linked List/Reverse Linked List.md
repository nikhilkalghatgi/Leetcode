# Reverse Linked List

## Problem Statement
Given the head of a singly linked list, reverse the list, and return the reversed list.

**Example:**
- Input: head = [1,2,3,4,5]
- Output: [5,4,3,2,1]

## Approach
Use three pointers: prev (initially None), current (starting at head), and next (to store the next node). Iteratively reverse the links by updating current.next to point to prev.

- **Time Complexity:** O(n)
- **Space Complexity:** O(1)

## Solution

```python
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def reverseList(self, head: ListNode) -> ListNode:
        prev = None
        cur = head
        
        while cur:
            next_node = cur.next
            cur.next = prev
            prev = cur
            cur = next_node
        
        return prev
```

## Test Cases

```python
# Test 1
sol = Solution()
head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
result = sol.reverseList(head)
# Result: 5 -> 4 -> 3 -> 2 -> 1
assert result.val == 5
assert result.next.val == 4

# Test 2
head = ListNode(1, ListNode(2))
result = sol.reverseList(head)
assert result.val == 2
assert result.next.val == 1

# Test 3
head = None
result = sol.reverseList(head)
assert result is None
```

