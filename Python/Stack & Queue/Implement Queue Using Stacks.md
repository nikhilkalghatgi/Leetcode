# Implement Queue Using Stacks

## Problem Statement
Implement a first in first out (FIFO) queue using only two stacks. The implemented queue should support all the functions of a normal queue (`push`, `pop`, `peek`, `empty`).

**Example:**
- MyQueue() creates an empty queue
- push(1) adds 1 to the queue
- push(2) adds 2 to the queue
- peek() returns 1 (front element)
- pop() removes and returns 1
- empty() returns false

## Approach
Use two stacks: inStack for push operations and outStack for pop/peek operations. When outStack is empty, transfer all elements from inStack (which reverses the order, converting to FIFO).

- **Time Complexity:** O(1) amortized for all operations
- **Space Complexity:** O(n)

## Solution

```python
class MyQueue:
    def __init__(self):
        self.in_stack = []
        self.out_stack = []
    
    def push(self, x: int) -> None:
        self.in_stack.append(x)
    
    def pop(self) -> int:
        if not self.out_stack:
            while self.in_stack:
                self.out_stack.append(self.in_stack.pop())
        return self.out_stack.pop()
    
    def peek(self) -> int:
        if not self.out_stack:
            while self.in_stack:
                self.out_stack.append(self.in_stack.pop())
        return self.out_stack[-1]
    
    def empty(self) -> bool:
        return len(self.in_stack) == 0 and len(self.out_stack) == 0
```

## Test Cases

```python
# Test 1
q = MyQueue()
q.push(1)
q.push(2)
assert q.peek() == 1
assert q.pop() == 1
assert q.empty() == False

# Test 2
q = MyQueue()
q.push(1)
assert q.empty() == False
assert q.pop() == 1
assert q.empty() == True

# Test 3
q = MyQueue()
q.push(1)
q.push(2)
q.push(3)
assert q.pop() == 1
assert q.pop() == 2
assert q.pop() == 3
assert q.empty() == True
```

