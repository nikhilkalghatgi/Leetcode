Given a positive integer n, write a function that returns the number of set bits in its binary representation (also known as the Hamming weight).

```cpp
class Solution {
public:
    int hammingWeight(int n) {
        int count = 0;

        while(n){
            count+= (n&1);
            n>>=1;
        }
        return count;
    }
};
```