Bitwise for Power Of Two:
```cpp
bool isPowerOfTwo(int n){
    if(n<=0) return false;
    return (n&(n-1))==0;
}

```

Recursion power of two:
```cpp
bool isPowerOfTwo(int n){
    if (n<=0) return false;
    if(n==1) return true;
    if(n%2!=0) return false;
    return isPowerOfTwo(n/2);
}
```

Recursion power of three:
```cpp
bool isPowerOfThree(int n){
    if (n<=0) return false;
    if(n==1) return true;
    if(n%3!=0) return false;
    return isPowerOfThree(n/3);
}
```

Recursion power of Four:
```cpp
bool isPowerOfFour(int n){
    if (n<=0) return false;
    if(n==1) return true;
    if(n%4!=0) return false;
    return isPowerOfFour(n/4);
}
```