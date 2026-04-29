# Linked List Cycle

## Problem Statement
Given the head of a linked list, determine if the linked list has a cycle in it. There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the `next` pointer. Return `true` if there is a cycle in the linked list. Otherwise, return `false`.

**Example:**
- Input: head = [3,2,0,-4] with cycle at position 1
- Output: true

## Approach
Use Floyd's Cycle Detection Algorithm with two pointers: slow (moves 1 step) and fast (moves 2 steps). If they meet, a cycle exists. If fast reaches the end, no cycle exists.

- **Time Complexity:** O(n)
- **Space Complexity:** O(1)

## Solution

```python
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    def hasCycle(self, head: ListNode) -> bool:
        if not head or not head.next:
            return False
        
        slow = head
        fast = head
        
        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next
            if slow == fast:
                return True
        
        return False
```

## Test Cases

```python
# Test 1: List with cycle
head = ListNode(3)
node2 = ListNode(2)
node3 = ListNode(0)
node4 = ListNode(-4)
head.next = node2
node2.next = node3
node3.next = node4
node4.next = node2  # cycle to node2

sol = Solution()
assert sol.hasCycle(head) == True

# Test 2: No cycle
head = ListNode(1)
head.next = ListNode(2)
assert sol.hasCycle(head) == False

# Test 3: Single node
head = ListNode(1)
assert sol.hasCycle(head) == False
```

