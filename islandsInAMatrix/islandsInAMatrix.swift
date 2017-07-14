import Foundation

func numOfBlocks(_ matrix: [[Int]]) -> Int {
    // Check if regular matrix (all rows have same length)
    var numCols = -1
    for row in matrix {
        if numCols < 0 {
            numCols = row.count  //first row count
        }
        else if row.count != numCols {
            return -1 // wrong matrix
        }
    }
    
    // Create a temp writable copy of the Matrix
    var _matrix = Array(repeating: Array(repeating: 0, count: numCols), count: matrix.count)
    for row in 0..<matrix.count {
        for col in 0..<matrix[row].count {
            _matrix[row][col] = matrix[row][col]
        }
    }
    
    // Deep First Search Traversal of a block
    func blockDFS(row: Int, col: Int) {
        guard row >= 0 && row < _matrix.count && col >= 0 && col < numCols else { return }
        guard _matrix[row][col] == 1 else { return }
        
        // Remove
        _matrix[row][col] = 0
        
        //Up
        blockDFS(row: row - 1, col: col)
        
        //Down
        blockDFS(row: row + 1, col: col)
        
        //Left
        blockDFS(row: row, col: col - 1)
        
        //Right
        blockDFS(row: row, col: col + 1)
    }

    // Count blocks
    var blockCounter = 0

    for row in 0..<_matrix.count {
        for col in 0..<_matrix[row].count {
            if _matrix[row][col] == 1 {
                blockCounter += 1
                blockDFS(row: row, col: col)
            }
        }
    }
    
    return blockCounter;
}

let testA: [[Int]] = [
    [0, 1, 1, 1],
    [1, 1, 1, 1],
    [0, 0, 0, 0],
    [1, 1, 0, 0]
]

let testB: [[Int]] = [
    [1, 1, 0],
    [0, 1, 1]
]

let testC: [[Int]] = [
    [1, 0, 1],
    [0, 1, 0]
]

let testD: [[Int]] = [
    [1, 0, 1],
    [1, 1, 1]
]

let testE: [[Int]] = [
    [1, 1],
    [1, 1]
]

let testF: [[Int]] = [
    [1, 1, 1, 0],
    [0, 1, 1, 0],
    [0, 0, 1, 1],
    [0, 1, 0, 1],
    [0, 1, 1, 1]
]

let testJ: [[Int]] = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 1, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 1, 1, 1, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 1, 1, 1, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 1, 0],
    [1, 1, 0, 0, 0, 0, 0, 0, 1, 1],
    [0, 1, 0, 0, 0, 0, 0, 1, 0, 1],
    [0, 1, 0, 0, 0, 0, 0, 1, 1, 1]
]


print(numOfBlocks(testA)) // 2
print(numOfBlocks(testB)) // 1
print(numOfBlocks(testC)) // 3
print(numOfBlocks(testD)) // 1
print(numOfBlocks(testE)) // 1
print(numOfBlocks(testF)) // 1
print(numOfBlocks(testJ)) // 3


/*
 Your previous Java content is preserved below:
 
 import java.io.*;
 import java.util.*;
 
 Given a binary matrix, find the number of "blocks of 1", where a block
 is defined as a collection of "1" where every member can be reached
 from any other member going only left, right, up or down. We do not
 consider a diagonal as a member. Examples:
 
 0 0 1 1
 0 1 1 1
 0 0 0 0
 1 1 0 0
 
 The above matrix contains 2 "blocks of one" (top right and bottom left).
 
 1 1 0
 0 1 1
 
 The above matrix contains 1 block since every member can be reached from any other member going only left/right/up/down.
 
 1 0 1
 0 1 0
 
 The above matrix contains 3 blocks since we do not consider a diagonal as a member.
 
 class Solution {
 public static void main(String[] args) {
 int[][] testA = new int[][] {
 new int[] {0, 0, 1, 1},
 new int[] {0, 1, 1, 1},
 new int[] {0, 0, 0, 0},
 new int[] {1, 1, 0, 0}
 };
 
 int[][] testB = new int[][] {
 new int[] {1, 1, 0},
 new int[] {0, 1, 1}
 };
 
 int[][] testC = new int[][] {
 new int[] {1, 0, 1},
 new int[] {0, 1, 0}
 };
 
 System.out.println(numOfBlocks(testA));
 System.out.println(numOfBlocks(testB));
 System.out.println(numOfBlocks(testC));
 }
 
 private static int numOfBlocks(int[][] matrix) {
 return 0;
 }
 }
 */
