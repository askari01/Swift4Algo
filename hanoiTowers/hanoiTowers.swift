import Foundation

func hanoi(towers: inout [[Int]], numbers: Int, source: Int, dest: Int, temp: Int) {
    if numbers == 1 {
        print("+move \(towers[source][towers[source].count - 1]) from \(source) to \(dest)")
        towers[dest].append(towers[source][towers[source].count - 1])
        towers[source].remove(at: towers[source].count - 1)
    }
    else {
        hanoi(towers: &towers, numbers: numbers - 1, source: source, dest: temp, temp: dest)
        print("-move \(towers[source][towers[source].count - 1]) from \(source) to \(dest)")
        towers[dest].append(towers[source][towers[source].count - 1])
        towers[source].remove(at: towers[source].count - 1)
        hanoi(towers: &towers, numbers: numbers - 1, source: temp, dest: dest, temp: source)
    }
}

var towers = [[4, 3, 2, 1], [], []]

print(towers)
hanoi(towers: &towers, numbers: towers[0].count, source: 0, dest: 1, temp: 2)
print(towers)
