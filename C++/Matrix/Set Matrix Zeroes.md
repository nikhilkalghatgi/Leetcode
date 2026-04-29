Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's.


```cpp

class Solution {
public:
    void setZeroes(vector<vector<int>>& matrix) {
        int m = matrix.size();
        int n = matrix[0].size();

        std::vector<int> row(m,0);
        std::vector<int> col(n,0);

        for(int i=0; i<m; i++){
            for (int j=0; j<n;j++){
                if(matrix[i][j]==0){
                    row[i]=1;
                    col[j]=1;
                }
            }
        }
        for(int i=0; i<m; i++){
            for (int j=0; j<n;j++){
                if(row[i]||col[j]){
                    matrix[i][j]=0;
                }
            }
        }
    }
};
```