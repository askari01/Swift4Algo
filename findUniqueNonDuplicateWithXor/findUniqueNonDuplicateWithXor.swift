import Foundation

func findUniqueNonDuplicateWithXor(_ array: [Int]) -> Int {
    var duplicate = 0
    
    for element in array {
        duplicate ^= element
    }
    
    return duplicate
}

var array: [Int] = []

array.append(1)
array.append(2)
array.append(1)
array.append(3)
array.append(4)          // Just Once !!!
array.append(5)
array.append(2)
array.append(5)
array.append(3)

findUniqueNonDuplicateWithXor(array)
