Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.

```cpp
#include <unordered_map>
using namespace std;

class Solution {
public:
    bool canConstruct(string ransomNote, string magazine) {
        unordered_map<char, int> freq;

        // count letters in magazine
        for (char c : magazine) {
            freq[c]++;
        }

        // use letters for ransomNote
        for (char c : ransomNote) {
            if (freq[c] == 0)
                return false;
            freq[c]--;
        }

        return true;
    }
};
```