There are n gas stations along a circular route.

gas[i] = amount of gas at station i
cost[i] = gas required to travel from station i to (i+1) % n

You have an empty tank at the beginning.
Return the starting gas station's index if you can travel around the circuit exactly once in the clockwise direction. Otherwise, return -1.

Input:
gas = [1,2,3,4,5]
cost = [3,4,5,1,2]

Output: 3

```cpp
#include <iostream>
#include <vector>
using namespace std;

int canCompleteCircuit(vector<int>& gas, vector<int>& cost)
{
    int totalGas = 0;
    int currentGas = 0;
    int start = 0;

    for (int i = 0; i < gas.size(); i++)
    {
        int gain = gas[i] - cost[i];

        totalGas += gain;
        currentGas += gain;

        if (currentGas < 0)
        {
            start = i + 1;
            currentGas = 0;
        }
    }

    return (totalGas >= 0) ? start : -1;
}

int main()
{
    vector<int> gas = {1,2,3,4,5};
    vector<int> cost = {3,4,5,1,2};

    cout << canCompleteCircuit(gas, cost);

    return 0;
}

```
