# Network Delay Time (Dijkstra)

## Problem Statement
You are given a network of n nodes, labeled from 1 to n. You are also given `times`, a list of travel times as directed edges `times[i] = (u, v, w)`, where u is the source node, v is the target node, and w is the time it takes for a signal to travel from source to target. We will send a signal from a given node k. Return the minimum time it takes for all the n nodes to receive the signal. If it is impossible for all the n nodes to receive the signal, return -1.

**Example:**
- Input: `times = [[2,1,1],[2,3,1],[3,4,1]], n = 4, k = 2`
- Output: `2`

## Approach
Use Dijkstra's algorithm with a min-heap. Find the shortest path from source node k to all other nodes. The answer is the maximum distance among all nodes.

- **Time Complexity:** O((V + E) log V)
- **Space Complexity:** O(V + E)

## Solution

```python
import heapq
from collections import defaultdict

class Solution:
    def networkDelayTime(self, times: list[list[int]], n: int, k: int) -> int:
        adj = defaultdict(list)
        
        for u, v, w in times:
            adj[u].append((v, w))
        
        dist = [float('inf')] * (n + 1)
        dist[k] = 0
        
        min_heap = [(0, k)]
        
        while min_heap:
            time, node = heapq.heappop(min_heap)
            
            if time > dist[node]:
                continue
            
            for neighbor, weight in adj[node]:
                if dist[node] + weight < dist[neighbor]:
                    dist[neighbor] = dist[node] + weight
                    heapq.heappush(min_heap, (dist[neighbor], neighbor))
        
        max_time = max(dist[1:n+1])
        return max_time if max_time != float('inf') else -1
```

## Test Cases

```python
# Test 1
sol = Solution()
times = [[2,1,1],[2,3,1],[3,4,1]]
assert sol.networkDelayTime(times, 4, 2) == 2

# Test 2
times = [[1,2,1]]
assert sol.networkDelayTime(times, 2, 1) == 1

# Test 3
times = [[1,2,1]]
assert sol.networkDelayTime(times, 2, 2) == -1
```

