# BST: Second Greatest
 
Write a function to find the 2nd largest element in a binary search tree 

Our first thought might be, "it's simply the parent of the largest element!" That seems obviously true when we imagine a nicely balanced tree like this one:

           ( 5 )
          /     \
        (3)     (8)
       /  \     /  \
     (1)  (4) (7)  (9)
  But what if the largest element itself has a left subtree?



           ( 5 )
          /     \
        (3)     (8)
       /  \     /  \
     (1)  (4) (7)  (12)
                   /
                 (10)
                 /  \
               (9)  (11)
  Here the parent of our largest is 8, but the second largest is 11.

