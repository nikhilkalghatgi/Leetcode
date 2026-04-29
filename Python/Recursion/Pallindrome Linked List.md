# Palindrome Linked List

## Problem Statement
Given the head of a singly linked list, return `true` if it is a palindrome, and `false` otherwise.

**Example:**
- Input: head = [1,2,2,1]
- Output: true

## Approach
Use recursion with a pointer. Traverse to the end of the list, then compare nodes while backtracking. The outer pointer moves forward one step for each recursive call.

- **Time Complexity:** O(n)
- **Space Complexity:** O(n) for recursion stack

## Solution

```python
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def isPalindrome(self, head: ListNode) -> bool:
        self.left = head
        return self.check(head)
    
    def check(self, right):
        if not right:
            return True
        
        result = self.check(right.next)
        
        if not result:
            return False
        
        if self.left.val != right.val:
            return False
        
        self.left = self.left.next
        return True
```

## Test Cases

```python
# Test 1: Palindrome
sol = Solution()
head = ListNode(1, ListNode(2, ListNode(2, ListNode(1))))
assert sol.isPalindrome(head) == True

# Test 2: Not palindrome
head = ListNode(1, ListNode(2, ListNode(3)))
assert sol.isPalindrome(head) == False

# Test 3: Single node
head = ListNode(1)
assert sol.isPalindrome(head) == True

# Test 4: Two identical nodes
head = ListNode(1, ListNode(1))
assert sol.isPalindrome(head) == True
```

