# atoi (ASCII to Int)
 
 Write a function to convert a string into an integer.  (This function is called A to I (or  atoi()) because we are converting an ASCII string into an integer.)
 
Good answer: Go through the string from beginning to end.  If the first character is a  negative sign, remember this fact.  Keep a running total, which starts at 0.  Each time  you reach a new digit, multiply the total by 10 and add the new digit.  When you  reach the end, return the current total, or, if there was a negative sign, the inverse of  the number.
 
 Okay answer: Another approach is to go through the string from end to beginning,  again keeping a running total.  Also, remember a number x representing which digit  you are currently on; x is initially 1.  For each character, add the current digit times x  to the running total, and multiply x by 10.  When you reach the beginning, return the  current total, or, if there was a negative sign, the inverse of the number.
