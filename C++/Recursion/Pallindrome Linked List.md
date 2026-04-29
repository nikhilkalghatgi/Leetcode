
```cpp
class Solution {
    ListNode* left;

public:
    bool isPalindrome(ListNode* head) {
        left = head;
        return check(head);
    }

    bool check(ListNode* right) {
        if (!right) return true;

        // Go to end
        bool result = check(right->next);

        // If already false, stop early
        if (!result) return false;

        // Compare left and right
        if (left->val != right->val)
            return false;

        // Move left forward
        left = left->next;

        return true;
    }
};


```