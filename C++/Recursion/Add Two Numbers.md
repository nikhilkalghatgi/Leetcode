You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
```cpp
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */

class Solution {
public:
    
    ListNode* add(ListNode* l1, ListNode* l2, int carry) {
        // Base case
        if (!l1 && !l2 && carry == 0)
            return nullptr;
        
        int sum = carry;
        
        if (l1) sum += l1->val;
        if (l2) sum += l2->val;
        
        ListNode* node = new ListNode(sum % 10);
        
        node->next = add(
            l1 ? l1->next : nullptr,
            l2 ? l2->next : nullptr,
            sum / 10
        );
        
        return node;
    }
    
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        return add(l1, l2, 0);
    }
};

```
##Without Recursion
```cpp
class Solution {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        
        ListNode dummy(0);
        ListNode* cur = &dummy;
        int carry = 0;
        while(l1 || l2 || carry){
            int sum = carry;
            if (l1){
                sum += l1->val;
                l1 = l1->next;
            }
            if (l2){
                sum+=l2->val;
                l2=l2->next;
            }
            carry = sum/10;
            cur->next = new ListNode(sum%10);
            cur = cur->next; 

        }
        return dummy.next;
    }
};
```