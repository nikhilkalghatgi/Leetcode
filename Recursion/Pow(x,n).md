My version O(n)
```cpp
class Solution {
public:
    double myPow(double x, int n) {
        if(n==0) return 1.0;
        else if (n>0){
            x*=myPow(x,n-1);
            return x;
        }
        else{
            x*=1.0/myPow(x,-(n-1));
            return x;
        }
        
    }
};
```
O(log n) version
```cpp
class Solution {
public:
    
    double myPow(double x, long long n) {
        
        // Base case
        if (n == 0) 
            return 1.0;
        
        // Handle negative power
        if (n < 0) 
            return 1.0 / myPow(x, -n);
        
        // Recursive case
        double half = myPow(x, n / 2);
        
        if (n % 2 == 0)
            return half * half;
        else
            return half * half * x;
    }
};
```