# Merge Two Sorted Linked Lists

## Problem Statement
You are given the heads of two sorted linked lists `list1` and `list2`. Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists. Return the head of the merged linked list.

**Example:**
- Input: `list1 = [1,2,4], list2 = [1,3,4]`
- Output: `[1,1,2,3,4,4]`

## Approach
Use a dummy node and a tail pointer. Compare nodes from both lists and append the smaller one to the merged list. Continue until one list is exhausted, then append the remaining nodes.

- **Time Complexity:** O(m + n) where m and n are lengths
- **Space Complexity:** O(1) excluding output list

## Solution

```python
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def mergeTwoLists(self, list1: ListNode, list2: ListNode) -> ListNode:
        dummy = ListNode(0)
        tail = dummy
        
        while list1 and list2:
            if list1.val <= list2.val:
                tail.next = list1
                list1 = list1.next
            else:
                tail.next = list2
                list2 = list2.next
            tail = tail.next
        
        tail.next = list1 if list1 else list2
        return dummy.next
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

