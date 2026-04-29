Undirected Graph 
Graph:
0 - 1
 \ /
  2 - 3 - 4

Adj list:

0 → 1,2  
1 → 0,2  
2 → 0,1,3  
3 → 2,4  
4 → 3  


```cpp
#include <bits/stdc++.h>
using namespace std;

bool dfs(int node, int parent, vector<vector<int>>& adj, vector<bool>& visited) {
    visited[node] = true;

    for (int neighbor : adj[node]) {
        if (!visited[neighbor]) {
            if (dfs(neighbor, node, adj, visited))
                return true;
        }
        else if (neighbor != parent) {
            return true; // cycle found
        }
    }
    return false;
}

int main() {
    int n = 5;

    vector<vector<int>> adj(n);

    // Undirected graph with cycle
    adj[0] = {1, 2};
    adj[1] = {0, 2};
    adj[2] = {0, 1, 3};
    adj[3] = {2, 4};
    adj[4] = {3};

    vector<bool> visited(n, false);

    for (int i = 0; i < n; i++) {
        if (!visited[i]) {
            if (dfs(i, -1, adj, visited)) {
                cout << "Cycle Detected\n";
                return 0;
            }
        }
    }

    cout << "No Cycle\n";
    return 0;
}
```