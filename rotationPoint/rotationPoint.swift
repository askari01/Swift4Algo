import Foundation

func rotationPoint(_ array: [Int], from: Int = 0, to: Int = array.count) -> Int {
    guard array.count > 1 else { return from }
    let middle = (from+to)/2
    guard middle > 0 else {return from}
    
    if array[middle-1] > array[middle] {
        return middle
    }
    
    if array[from] > array[middle] {
        return rotationPoint(array, from: from, to: middle)
    }
    else {
        return rotationPoint(array, from: middle, to: to)
    }
}

var array:[Int] = []

for i in 10..<100 {
    array.append(i)
}
for i in 0..<10 {
    array.append(i)
}

print(array)
let r = rotationPoint(array)
print("rotation Point \(r) - [r] = \(array[r])")


