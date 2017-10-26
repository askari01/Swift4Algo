//"In a stream of integers from 1 to n, only one number will be repeated. How can you tell what that number is?"

import Foundation

class DuplicateFinder {
    var sum = 0
    var num = 0
    
    func add(_ n: Int) {
        sum += n
        num += 1
    }
    
    func findDuplicate() -> Int {
        guard num > 1 else { return -1 }
        let expectedSum = num*(num-1)/2
        return sum - expectedSum
    }
}


var d = DuplicateFinder()
d.findDuplicate()

let t = arc4random_uniform(100) + 100

for i in 1...t {
    d.add(Int(i))
}

let r = arc4random_uniform(t) + 1
d.add(Int(r))

print("t = \(t) r = \(r) d = \(d.findDuplicate())")

