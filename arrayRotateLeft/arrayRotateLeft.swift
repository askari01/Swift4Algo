import Foundation;

func rotate(array: inout [Int], n: Int) {
    guard n >= 0 else { return }
    if n >= array.count  {
        return rotate(array: &array, n: n - array.count)
    }
    
    let temp = array[0..<n]
    
    for i in 0..<array.count {
        if i < (array.count - n) {
            array[i] = array[i+n]
        }
        else {
            array[i] = temp[i - (array.count - n)]
        }
    }
}

var array = [1, 2, 3, 4, 5]
rotate(array: &array, n: 13)

print(array.map{String($0)}.reduce(""){ $0 + $1 })
