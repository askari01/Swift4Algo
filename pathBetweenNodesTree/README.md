# Path Between Nodes in a Tree 
 
Design an algorithm to find a path from one node in a binary tree to another.   

Good Answer: There will always be exactly one path: from the starting node to the  lowest common ancestor of the nodes to the second node.  The goal is to identify the  lowest common ancestor. 


                   17 
               /        \
              6          46 
            /   \          \
           3      12        56 
          /       /\       /
         1       9 15    48

For each node, keep track of a set of nodes in the binary tree (using a hash table or a  BST) as well as a current node.  At each iteration, for each of the two current nodes,  change the current node to be its parent and add it to the appropriate set.  The first  element that is added to one set when it is already present in the other set is the  lowest common ancestor.  This algorithm takes O(n) time, where n is the length of  the path.  For example, if we were finding the lowest common ancestor of 3 and 15  in the above tree, our algorithm would do the following: 
 
Current node 1 | Current node 2 |   Set 1   |   Set 2
--------------------------------------------------------
      3        |       15       |     3     |     15
      6        |       12       |   3, 6    |   15, 12
      17       |       6        |  3, 6, 17 | 15, 12, 6

