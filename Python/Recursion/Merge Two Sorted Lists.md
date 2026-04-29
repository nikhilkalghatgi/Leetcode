# Merge Two Sorted Lists (Recursive)

## Problem Statement
You are given the heads of two sorted linked lists `list1` and `list2`. Merge the two lists into one sorted list using recursion. The list should be made by splicing together the nodes of the first two lists. Return the head of the merged linked list.

**Example:**
- Input: `list1 = [1,2,4], list2 = [1,3,4]`
- Output: `[1,1,2,3,4,4]`

## Approach
Use recursion. Base cases: if either list is empty, return the other. Otherwise, compare the first nodes and recursively merge the smaller node's next with the other list.

- **Time Complexity:** O(m + n)
- **Space Complexity:** O(m + n) for recursion stack

## Solution

```python
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def mergeTwoLists(self, list1: ListNode, list2: ListNode) -> ListNode:
        if not list1:
            return list2
        if not list2:
            return list1
        
        if list1.val < list2.val:
            list1.next = self.mergeTwoLists(list1.next, list2)
            return list1
        else:
            list2.next = self.mergeTwoLists(list1, list2.next)
            return list2
```

## Test Cases

```python
# Test 1
sol = Solution()
list1 = ListNode(1, ListNode(2, ListNode(4)))
list2 = ListNode(1, ListNode(3, ListNode(4)))
result = sol.mergeTwoLists(list1, list2)
# Result: 1 -> 1 -> 2 -> 3 -> 4 -> 4
assert result.val == 1
assert result.next.val == 1

# Test 2
list1 = None
list2 = None
result = sol.mergeTwoLists(list1, list2)
assert result is None

# Test 3
list1 = ListNode(1)
list2 = None
result = sol.mergeTwoLists(list1, list2)
assert result.val == 1
```

