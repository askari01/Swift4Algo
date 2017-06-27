# Deck Shuffling (randomize existing array)
 
Given an array of distinct integers, give an algorithm to randomly reorder the  integers so that each possible reordering is equally likely.  In other words, given a  deck of cards, how can you shuffle them such that any permutation of cards is  equally likely? 
 
Good answer: Go through the elements in order, swapping each element with a  random element in the array that does not appear earlier than the element.  This  takes O(n) time. 

