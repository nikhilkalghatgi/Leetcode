# Min Stack

## Problem Statement
Design a stack that supports push, pop, top, and retrieving the minimum element in constant time. Implement the `MinStack` class with the following operations:
- `MinStack()` initializes the stack
- `push(val)` pushes the element val onto the stack
- `pop()` removes the element on the top of the stack
- `top()` gets the top element of the stack
- `getMin()` retrieves the minimum element in the stack

All operations must run in O(1) time.

**Example:**
- push(-2), push(0), push(-3) → stack: [-2, 0, -3]
- getMin() → returns -3
- pop() → removes -3
- top() → returns 0
- getMin() → returns -2

## Approach
Maintain two stacks: one for regular elements and one for minimum values at each level. Whenever we push, we also push the minimum up to that point.

- **Time Complexity:** O(1) for all operations
- **Space Complexity:** O(n)

## Solution

```python
class MinStack:
    def __init__(self):
        self.stack = []
        self.min_stack = []
    
    def push(self, val: int) -> None:
        self.stack.append(val)
        if not self.min_stack:
            self.min_stack.append(val)
        else:
            self.min_stack.append(min(val, self.min_stack[-1]))
    
    def pop(self) -> None:
        self.stack.pop()
        self.min_stack.pop()
    
    def top(self) -> int:
        return self.stack[-1]
    
    def getMin(self) -> int:
        return self.min_stack[-1]
```

## Test Cases

```python
# Test 1
min_stack = MinStack()
min_stack.push(-2)
min_stack.push(0)
min_stack.push(-3)
assert min_stack.getMin() == -3
min_stack.pop()
assert min_stack.top() == 0
assert min_stack.getMin() == -2

# Test 2
min_stack = MinStack()
min_stack.push(0)
min_stack.push(1)
min_stack.push(0)
assert min_stack.getMin() == 0
min_stack.pop()
assert min_stack.getMin() == 0

# Test 3
min_stack = MinStack()
min_stack.push(2147483647)
min_stack.push(-2147483648)
assert min_stack.getMin() == -2147483648
```

