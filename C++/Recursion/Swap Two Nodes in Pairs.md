
```cpp

class Solution {
public:
    ListNode* swapPairs(ListNode* head) {
        
        // Base case: 0 or 1 node left
        if (!head || !head->next)
            return head;
        
        ListNode* first = head;
        ListNode* second = head->next;
        
        // Recursively swap the rest
        first->next = swapPairs(second->next);
        
        // Swap current pair
        second->next = first;
        
        // Return new head (second)
        return second;
    }
};
```