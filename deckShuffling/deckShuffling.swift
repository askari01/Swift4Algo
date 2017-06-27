import Foundation

func createSortedArrayOfSize(_ n: Int) -> [Int] {
    var array = [Int]()
    for i in 0..<n {
        array.append(i)
    }
    return array
}

func randomizeArray(_ array: inout [Int]) {
    for i in 0..<array.count {
        let r = i + Int(arc4random_uniform(UInt32(array.count - i)))
        (array[i], array[r]) = (array[r], array[i])
    }
}

var array = createSortedArrayOfSize(100)
randomizeArray(&array)
print(array)
print(array.sorted())
