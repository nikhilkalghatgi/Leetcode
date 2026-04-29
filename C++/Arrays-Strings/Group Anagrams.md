Given an array of strings strs, group the anagrams together. You can return the answer in any order.


Example 1:

Input: strs = ["eat","tea","tan","ate","nat","bat"]

Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

```cpp
class Solution {
public:
    vector<vector<string>> groupAnagrams(vector<string>& strs) {
        
        unordered_map<string, vector<string>> mp;
        vector<vector<string>> result;
        for(string s: strs){
            vector<int> freq(26, 0);
            for(char c: s){
                freq[c-'a']++;
            }
            string key= "";
            for(int i=0; i<26;i++){
                key += to_string(freq[i]) + '#';
            }
            mp[key].push_back(s);
        }
        for(auto& it: mp){
            result.push_back(it.second);
        }
        return result;
    }
};
```

## Step-by-Step Trace
👉 1. Process "eat"
Frequency array:
a=1, e=1, t=1, rest=0
Key:
"1#0#0#0#1#0#...#1#..."   (26 values total)

👉 Map becomes:

key1 → ["eat"]
👉 2. Process "tea"
Frequency:
a=1, e=1, t=1
Key:

Same as "eat" ✅

👉 Map:

key1 → ["eat", "tea"]
👉 3. Process "tan"
Frequency:
a=1, n=1, t=1
Key:

Different from previous

👉 Map:

key1 → ["eat", "tea"]
key2 → ["tan"]
👉 4. Process "ate"

Same frequency as "eat":

👉 Map:

key1 → ["eat", "tea", "ate"]
key2 → ["tan"]
👉 5. Process "nat"

Same as "tan":

👉 Map:

key1 → ["eat", "tea", "ate"]
key2 → ["tan", "nat"]