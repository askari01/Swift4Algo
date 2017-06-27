import Foundation

func _arc4random_uniform(_ upperBound: UInt32) -> Int {
    guard upperBound > 1 else { return 0 }
    var bits = 0
    var u = upperBound
    while u > 0 {
        bits += 1
        u = u / 2
    }
    
    var array:[UInt8] = Array(repeating: 0, count: Int(bits))
    
    for i in 0..<bits {
        array[i] = UInt8(arc4random_uniform(2))
    }
    
    var r = 0
    for i in stride(from: bits-1, to: -1, by: -1) {
        let b = array[i]
        if b != 0 {
            r += Int(pow(Double(2), Double(i)))
        }
    }
    
    if r >= upperBound {
        return _arc4random_uniform(upperBound)
    }
    
    return r
}

for _ in 0..<10 {
    print(_arc4random_uniform(6))
}

