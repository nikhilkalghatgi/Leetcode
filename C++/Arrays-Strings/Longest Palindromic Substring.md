Given a string s, return the longest palindromic substring in s.

Input: s = "babad"
Output: "bab"

```cpp

#include <string>
#include <iostream>

std::string longpalli(std::string& s){
    int len = s.size();
    int maxlen = 0;
    int start = 0;
    for (int i=0; i<len;i++){
        int left = i;
        int right = i;
        //odd len
        
        while(left>=0 && right<len && s[left]==s[right]){
            if (right-left+1 > maxlen){
                maxlen = right-left+1;
                start = left;
            }
            left--;
            right++;
            
        }
        //evenlen
        left = i;
        right = i+1;
        while(left>=0 && right<len && s[left]==s[right]){
            if (right-left+1 > maxlen){
                maxlen = right-left+1;
                start = left;
            }
            left--;
            right++;
            
        }
        
    }
    return s.substr(start, maxlen);
    
    
}


int main()
{
    // Input: s = "babad"
    // Output: "bab"
    std::string s = "babad";
    std::string res  = longpalli(s);
    std::cout<<res<<std::endl;

    return 0;
}

```
