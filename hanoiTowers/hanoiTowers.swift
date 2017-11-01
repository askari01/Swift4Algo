import Foundation

struct Hanoi {
    let size: Int
    var towers: [[Int]]
    
    init?(size: Int) {
        guard size > 0 else { return nil }
        self.size = size
        towers = [[Int]](repeating: [Int](), count: 3)
        for i in (1...size).reversed() {
            towers[0].append(i)
        }
    }
    
    mutating func solve() {
        solve(count: size, source: 0, dest: 1, temp: 2)
    }
    
    mutating func solve(count: Int, source: Int, dest: Int, temp: Int) {
        if count == 1 {
            towers[dest].append(towers[source].removeLast())
        }
        else {
            solve(count: count-1, source: source, dest: temp, temp: dest)
            towers[dest].append(towers[source].removeLast())
            solve(count: count-1, source: temp, dest: dest, temp: source)
        }
    }
    
    func print() {
        Swift.print(towers)
    }
}

if var h = Hanoi(size: 4) {
    h.print()
    h.solve()
    h.print()
}



//func hanoi(towers: inout [[Int]], numbers: Int, source: Int, dest: Int, temp: Int) {
//    if numbers == 1 {
//        print("+move \(towers[source][towers[source].count - 1]) from \(source) to \(dest)")
//        towers[dest].append(towers[source][towers[source].count - 1])
//        towers[source].remove(at: towers[source].count - 1)
//    }
//    else {
//        hanoi(towers: &towers, numbers: numbers - 1, source: source, dest: temp, temp: dest)
//        print("-move \(towers[source][towers[source].count - 1]) from \(source) to \(dest)")
//        towers[dest].append(towers[source][towers[source].count - 1])
//        towers[source].remove(at: towers[source].count - 1)
//        hanoi(towers: &towers, numbers: numbers - 1, source: temp, dest: dest, temp: source)
//    }
//}
//
//var towers = [[4, 3, 2, 1], [], []]
//
//print(towers)
//hanoi(towers: &towers, numbers: towers[0].count, source: 0, dest: 1, temp: 2)
//print(towers)




