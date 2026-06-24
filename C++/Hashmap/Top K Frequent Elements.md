Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

Example 1:
Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]

```cpp


#include <iostream>
#include <vector>
#include <algorithm>
#include <unordered_map>
#include <functional>
#include <queue>

std::vector<int> freqelem(std::vector<int>& arr, int k){
    std::unordered_map<int,int> freq;
    
    for (auto i: arr){
        freq[i]++;
    }
    std::priority_queue<std::pair<int,int>, std::vector<std::pair<int,int>>, std::greater<std::pair<int,int>>> pq;
    
    for (auto& it: freq){
        pq.push({it.second, it.first});
        if(pq.size()>k){
            pq.pop();
        }
    }
    std::vector<int> res;
    while(!pq.empty()){
        res.push_back(pq.top().second);
        pq.pop();
    }
    return res;
}


int main()
{   
    //Input: nums = [1,1,1,2,2,3], k = 2
    std::vector<int> arr = {1,1,1,2,2,3};
    int k = 2;
    std::vector<int> res = freqelem(arr, k);
    for (int i: res){
        std::cout<<i<<',';
    }
    std::cout<<" "<<std::endl;


    return 0;
}
```
