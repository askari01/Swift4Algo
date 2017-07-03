import Foundation;

func rotate(array: inout [Int], n: Int) {
    guard n > 0 else { return }
    
    if n % array.count == 0 {
        rotate(array: &array, n: n - array.count)
    }
    else {
        let temp = array[0..<n]
        for i in 0..<array.count {
            if i < array.count - n {
                array[i] = array[i+n]
            }
            else {
                array[i] = temp[i + n - array.count]
            }
        }
    }
}

var array = [1, 2, 3, 4, 5]
rotate(array: &array, n: 4)

var s = ""
array.forEach {s += "\($0) "}
print(s)

