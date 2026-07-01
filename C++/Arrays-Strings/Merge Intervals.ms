
Given an array of intervals where each interval is [start, end], merge all overlapping intervals and return the resulting intervals.
Example 
Input:
[[1,3],[2,6],[8,10],[15,18]]

Output:
[[1,6],[8,10],[15,18]]

Solution: sort then compare 


```cpp
#include <algorithm>
#include <vector>
#include <iostream>

std::vector<std::vector<int>> mergeIntervals(std::vector<std::vector<int>>& a){
    
    std::sort(a.begin(), a.end());
    std::vector<std::vector<int>> ans ;
    ans.push_back(a[0]);
    
    for (int i=1; i<a.size(); i++){
        if(a[i][0] <= ans.back()[1]){
            ans.back()[1] = std::max(a[i][1], ans.back()[1]);
        }
        else{
            ans.push_back(a[i]);
        }
    }
    return ans;
    
}

int main()
{
    // Input:
    // [[1,3],[2,6],[8,10],[15,18]]
    
    // Output:
    // [[1,6],[8,10],[15,18]]
    std::vector<std::vector<int>> a = {{1,3},{2,6},{8,10},{15,18}};
    
    std::vector<std::vector<int>> out = mergeIntervals(a);
    
    for (auto i: out){
        std::cout<<'[';
        for (auto j: i){
            std::cout<<j<<',';
        }
        std::cout<<']';
    }
    std::cout<<std::endl;
    

    return 0;
}
```
