# Cycle in Undirected Graph

## Problem Statement
Given an undirected graph with n vertices labeled from 0 to n-1, determine if the graph contains a cycle.

**Example:**
- Graph with edges: (0,1), (1,2), (2,0) → Contains cycle
- Graph with edges: (0,1), (1,2) → No cycle

## Approach
Use DFS to traverse the graph. For each unvisited node, perform DFS. If we visit a node that is already visited and is not the parent of the current node, a cycle is detected.

- **Time Complexity:** O(V + E) where V is vertices and E is edges
- **Space Complexity:** O(V)

## Solution

```python
class Solution:
    def hasCycle(self, n: int, edges: list[list[int]]) -> bool:
        adj = [[] for _ in range(n)]
        
        for u, v in edges:
            adj[u].append(v)
            adj[v].append(u)
        
        visited = [False] * n
        
        def dfs(node, parent):
            visited[node] = True
            for neighbor in adj[node]:
                if not visited[neighbor]:
                    if dfs(neighbor, node):
                        return True
                elif neighbor != parent:
                    return True
            return False
        
        for i in range(n):
            if not visited[i]:
                if dfs(i, -1):
                    return True
        
        return False
```

## Test Cases

```python
# Test 1
sol = Solution()
edges = [[0,1], [1,2], [2,0]]
assert sol.hasCycle(3, edges) == True

# Test 2
edges = [[0,1], [1,2]]
assert sol.hasCycle(3, edges) == False

# Test 3
edges = [[0,1], [0,2]]
assert sol.hasCycle(3, edges) == False
```

