import Foundation

var array = [Int]()

for i in 1...13 {
    for _ in 0..<4 {
        array.append(i)
    }
}

print(array)

extension Array {
    mutating func randomize() {
        for i in 0..<self.count {
            let r = i + Int(arc4random_uniform(UInt32(self.count - i)))
            (self[i], self[r]) = (self[r], self[i])
        }
    }
}

array.randomize()

print(array)

array.sort()

print(array)

