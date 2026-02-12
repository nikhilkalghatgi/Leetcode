✅ C++ HashSet solution

```cpp
#include <vector>
#include <unordered_set>
using namespace std;

class Solution {
public:
    bool isValidSudoku(vector<vector<char>>& board) {
        vector<unordered_set<char>> rows(9);
        vector<unordered_set<char>> cols(9);
        vector<unordered_set<char>> boxes(9);

        for (int r = 0; r < 9; r++) {
            for (int c = 0; c < 9; c++) {
                char val = board[r][c];

                if (val == '.') continue;

                int box = (r / 3) * 3 + (c / 3);

                if (rows[r].count(val) ||
                    cols[c].count(val) ||
                    boxes[box].count(val)) {
                    return false;
                }

                rows[r].insert(val);
                cols[c].insert(val);
                boxes[box].insert(val);
            }
        }

        return true;
    }
};
```
🧠 How it works

Example:

board[0][0] = '5'


Check:

rows[0] contains 5?  no
cols[0] contains 5?  no
box[0] contains 5?   no


Insert into all three sets.

If later another 5 appears in row 0:

rows[0].count('5') → true → invalid

⏱ Complexity

Time: O(81) → constant
Space: O(81) → constant

(9×9 board is fixed size)


BIT MASKING WAY:

```cpp
#include <vector>
using namespace std;

class Solution {
public:
    bool isValidSudoku(vector<vector<char>>& board) {
        int rows[9] = {0};
        int cols[9] = {0};
        int boxes[9] = {0};

        for (int r = 0; r < 9; r++) {
            for (int c = 0; c < 9; c++) {
                if (board[r][c] == '.') continue;

                int num = board[r][c] - '1';  // 0..8
                int mask = 1 << num;

                int box = (r / 3) * 3 + (c / 3);

                // check duplicate
                if ((rows[r] & mask) ||
                    (cols[c] & mask) ||
                    (boxes[box] & mask))
                    return false;

                // mark seen
                rows[r] |= mask;
                cols[c] |= mask;
                boxes[box] |= mask;
            }
        }

        return true;
    }
};

```