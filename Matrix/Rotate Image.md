You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).
```cpp
#include <vector>
using namespace std;

class Solution {
public:
    void rotate(vector<vector<int>>& matrix) {
        int n = matrix.size();

        // Step 1: transpose
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                swap(matrix[i][j], matrix[j][i]);
            }
        }

        // Step 2: reverse each row
        for (int i = 0; i < n; i++) {
            reverse(matrix[i].begin(), matrix[i].end());
        }
    }
};
```

Rotate 180 deg

```cpp
void rotate180(vector<vector<int>> &matrix){
    int n = matrix.size();

    for (int i=0; i<n; i++){
        for (int j=0; j<n; j++){
            ni = n-i-1;
            nj = n-j-1;
            std::swap(matrix[i][j], matrix[ni][nj]);
        }
    }
}
```
Manual Swap
```cpp
void mySwap(int &a, int &b) {
        int temp = a;
        a = b;
        b = temp;
    }

    void myReverse(vector<int> &row) {
        int left = 0;
        int right = row.size() - 1;

        while (left < right) {
            mySwap(row[left], row[right]);
            left++;
            right--;
        }
    }
```
