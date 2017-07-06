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
class FibDynamic {
    var mem:[Int:Int] = [:]
    
    func fibDynamic(_ n: Int) -> Int {
        time += 1
        guard n > 1 else { return n }
        
        if let memo = mem[n] {
            return memo
        }
        
        let result = fibDynamic(n - 1) + fibDynamic(n - 2)
        mem[n] = result
        
        return result
    }
}

time = 0
FibDynamic().fibDynamic(8)
time

//n (1 space)
func fibReverseLinear(_ n: Int) -> Int {
    guard n > 1 else { return n }
    
    var prevPrev = 0
    var prev = 1
    var current = 0
    
    for _ in 1..<n {
        current = prev + prevPrev
        prevPrev = prev
        prev = current
    }
    
    return current
}

fibReverseLinear(8)


