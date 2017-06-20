import Foundation

enum MyError : Error {
    case wrongArraySize
}

func getHeavierFrom(_ array: [Float]) throws -> Int {
    if array.count == 3 {
        if array[0] == array[1] {
            return 2
        }
        else if array[0] < array[1] {
            return 1
        }
        return 0
    }
    
    guard array.count == 8 else { throw MyError.wrongArraySize }
    
    let group1TotalWeight = array[0...2].reduce(0, +)
    let group2TotalWeight = array[3...5].reduce(0, +)
    
    if group1TotalWeight == group2TotalWeight {
        return array[6] > array[7] ? 6 : 7
    }
    else if group1TotalWeight > group2TotalWeight {
        return try getHeavierFrom(Array(array[0...2]))
    }
    return try getHeavierFrom(Array(array[3...5])) + 3
}

var array = [Float]()
for i in 0..<8 {
    var array = Array(repeating: Float(1.0), count: 8)
    array[i] = 2.0
    
    try! print("\(array) => \(getHeavierFrom(array))")
}

