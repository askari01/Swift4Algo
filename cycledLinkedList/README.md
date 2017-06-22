# Cycle in a Linked List 
 
How can one determine whether a singly linked list has a cycle? 

Good answer: Keep track of two pointers in the linked list, and start them at the beginning of the linked list. At each iteration of the algorithm, advance the first pointer by one node and the second pointer by two nodes. If the two pointers are ever the same (other than at the beginning of the algorithm), then there is a cycle. If a pointer ever reaches the end of the linked list before the pointers are the same, then there is no cycle. Actually, the pointers need not move one and two nodes at a time; it is only necessary that the pointers move at different rates. This takes O(n) time. This is a tricky answer that interviewers really like for some reason.  Okay answer: For every node you encounter while going through the list one by one, put a pointer to that node into a O(1)‐lookup time data structure, such as a hash set. Then, when you encounter a new node, see if a pointer to that node already exists in your hash set. This should take O(n) time, but also takes O(n) space.

Okay answer: Go through the elements of the list. "Mark" each node that you reach. If you reach a marked node before reaching the end, the list has a cycle; otherwise, it does not. This also takes O(n) time.

Note that this question is technically ill‐posed. An ordinary linked list will have no cycles. What they actually mean is for you to determine whether you can reach a cycle from a node in a graph consisting of nodes that have at most one outgoing edge. 
