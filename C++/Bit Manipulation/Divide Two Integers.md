Given two integers dividend and divisor, divide two integers without using multiplication, division, and mod operator.

The integer division should truncate toward zero, which means losing its fractional part. For example, 8.345 would be truncated to 8, and -2.7335 would be truncated to -2.

Return the quotient after dividing dividend by divisor.


```cpp
class Solution {
public:
    int divide(int dividend, int divisor) {
        
        long long dvd = llabs((long long)dividend);
        long long dvs = llabs((long long)divisor);
        bool negative = (dividend<0) ^ (divisor<0);
        
        long long quotient = 0;
        while (dvd>=dvs){
            long long temp = dvs;
            int multiple = 1;
            while(dvd>=(temp<<1)){
                temp<<=1;
                multiple<<=1;
            }
            quotient+=multiple;
            dvd-=temp;
        }
        return negative?-quotient:quotient;
    }
};
```
