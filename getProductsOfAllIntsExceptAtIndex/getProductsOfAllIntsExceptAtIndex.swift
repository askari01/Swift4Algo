import Foundation

func getProductsOfAllIntsExceptAtIndex(_ array: [Int]) -> [Int] {
    var tempArray = Array(repeating: 0, count: array.count)
    var previous = 1
    for i in 0..<array.count {
        tempArray[i] = previous
        previous *= array[i]
    }
    
    previous = 1
    for i in (0..<array.count).reversed() {
        tempArray[i] *= previous
        previous *= array[i]
    }
    
     return tempArray
}

getProductsOfAllIntsExceptAtIndex( [1, 7, 3, 4])
getProductsOfAllIntsExceptAtIndex( [1, 2, 6, 5, 9])

