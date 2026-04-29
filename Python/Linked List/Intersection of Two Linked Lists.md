# Intersection of Two Linked Lists

## Problem Statement
Given the heads of two singly linked-lists `headA` and `headB`, return the node at which the two lists intersect. If the two linked lists have no intersection at all, return `None`.

**Example:**
- If listA = [4,1,8,4,5] and listB = [5,6,1,8,4,5] intersect at node 8
- Return the node with value 8

## Approach
Use two pointers starting from each head. When they reach the end, switch to the other list's head. Both pointers will meet at the intersection node or both will become None if no intersection exists.

- **Time Complexity:** O(m + n) where m and n are lengths
- **Space Complexity:** O(1)

## Solution

```python
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    def getIntersectionNode(self, headA: ListNode, headB: ListNode) -> ListNode:
        if not headA or not headB:
            return None
        
        pA, pB = headA, headB
        
        while pA != pB:
            pA = headB if pA is None else pA.next
            pB = headA if pB is None else pB.next
        
        return pA
```

## Test Cases

```python
# Test 1: Lists intersect at node 8
# ListA: 4 -> 1 -> 8 -> 4 -> 5
# ListB: 5 -> 6 -> 1 -> 8 -> 4 -> 5
sol = Solution()
common = ListNode(8)
common.next = ListNode(4)
common.next.next = ListNode(5)

headA = ListNode(4)
headA.next = ListNode(1)
headA.next.next = common

headB = ListNode(5)
headB.next = ListNode(6)
headB.next.next = ListNode(1)
headB.next.next.next = common

result = sol.getIntersectionNode(headA, headB)
assert result.val == 8

# Test 2: No intersection
headA = ListNode(1)
headB = ListNode(2)
assert sol.getIntersectionNode(headA, headB) is None
```

