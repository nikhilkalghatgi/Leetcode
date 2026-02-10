
## START ALL VECTORS FROM LAST, CUZ:
## 1. increasing order, ie, max will be at the last
## 2. last n elements in nums1 will be 0

void merge(vector<int>& nums1, int m, vector<int>& nums2, int n) {
    int i = m - 1;        // last valid element in nums1
    int j = n - 1;        // last element in nums2
    int k = m + n - 1;    // last index of nums1

    while (i >= 0 && j >= 0) {
        if (nums1[i] > nums2[j]) {
            nums1[k] = nums1[i];
            i--;
        } else {
            nums1[k] = nums2[j];
            j--;
        }
        k--;
    }

    // copy remaining nums2 elements (if any)
    while (j >= 0) {
        nums1[k] = nums2[j];
        j--;
        k--;
    }
}