import Foundation

var time = 0

//n^2 (stack space)
func fibRecursive(_ n: Int) -> Int {
    time += 1
    guard n > 1 else { return n }
    
    return fibRecursive(n - 1) + fibRecursive(n - 2)
}

time = 0
fibRecursive(8)
time

//n (n space + stack)
func fibDynamic(_ n: Int) -> Int {
    var mem:[Int:Int] = [:]
    
    func _fibDynamic(_ n: Int) -> Int {
        time += 1
        guard n > 1 else { return n }
        
        if let memo = mem[n] {
            return memo
        }
        
        let result = _fibDynamic(n - 1) + _fibDynamic(n - 2)
        mem[n] = result
        
        return result
    }
    
    return _fibDynamic(n)
}

time = 0
fibDynamic(8)
time

//n (1 space)
func fibReverseLinear(_ n: Int) -> Int {
    guard n > 1 else { return n }
    
    var this = 1
    var previous = 0
    for _ in 2...n {
        (this, previous) = (this + previous, this)
    }
    
    return this
}


for i in 0..<16 {
    print("\(i) = \(fibRecursive(i)) - \(fibReverseLinear(i))")
}
