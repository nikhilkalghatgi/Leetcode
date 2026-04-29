# Add Two Numbers

## Problem Statement
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list. You may assume the two numbers do not contain any leading zero, except the number 0 itself.

**Example:**
- Input: `l1 = [2,4,3], l2 = [5,6,4]`
- Output: `[7,0,8]`
- Explanation: 342 + 465 = 807

## Approach
Iterate through both lists simultaneously, adding digits and handling carry. Create new nodes for the result list. Continue until both lists are exhausted and no carry remains.

- **Time Complexity:** O(max(m, n))
- **Space Complexity:** O(max(m, n))

## Solution

```python
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def addTwoNumbers(self, l1: ListNode, l2: ListNode) -> ListNode:
        dummy = ListNode(0)
        cur = dummy
        carry = 0
        
        while l1 or l2 or carry:
            sum_val = carry
            if l1:
                sum_val += l1.val
                l1 = l1.next
            if l2:
                sum_val += l2.val
                l2 = l2.next
            
            carry = sum_val // 10
            cur.next = ListNode(sum_val % 10)
            cur = cur.next
        
        return dummy.next
```

## Test Cases

```python
# Test 1: 342 + 465 = 807
sol = Solution()
l1 = ListNode(2, ListNode(4, ListNode(3)))
l2 = ListNode(5, ListNode(6, ListNode(4)))
result = sol.addTwoNumbers(l1, l2)
# Result: 7 -> 0 -> 8
assert result.val == 7
assert result.next.val == 0
assert result.next.next.val == 8

# Test 2: 0 + 0 = 0
l1 = ListNode(0)
l2 = ListNode(0)
result = sol.addTwoNumbers(l1, l2)
assert result.val == 0

# Test 3: 9999999 + 9999 = 10009998
l1 = ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9)))))))
l2 = ListNode(9, ListNode(9, ListNode(9, ListNode(9))))
result = sol.addTwoNumbers(l1, l2)
assert result.val == 8
```

