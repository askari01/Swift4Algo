//"In a stream of integers from 1 to n, only one number will be repeated. How can you tell what that number is?"

import Foundation

var array = [Int]()

for i in 1...13 {
    array.append(i)
}
array.append(7) //duplicate
print(array)

extension Array where Element: BinaryInteger {
    mutating func randomize() {
        for i in 0..<self.count {
            let r = i + Int(arc4random_uniform(UInt32(self.count - i)))
            (self[i], self[r]) = (self[r], self[i])
        }
    }
    
    func findDuplicate() -> Element? {
        guard !isEmpty else { return nil }
        let sum = self.reduce(0, +)
        guard let expectedSum = Element(exactly: (count - 1) * count / 2) else { return nil }
        return sum - expectedSum
    }
}

array.randomize()
print(array)
print(array.findDuplicate())
