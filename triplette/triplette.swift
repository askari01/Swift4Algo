// Given an array of distinct elements find triplets in the array whose sum is zero.
// O = n

import Foundation

func findTriplette(_ a: [Int]) -> [[Int]] {
    guard a.count > 2 else { return [[Int]]() }
    
    let s = a.sorted()
    let c = s.count
    var r = [[Int]]()
    var i=0, j=1, l=2, o=0
    
    func n() { i=o+1; j=i+1; l=i+2; o=i }
    func n2() { if j<c-2 { j+=1; l=j+1 } else { n() } }
    //print(s)
    
    while i<c && j<c && l<c {
        let t = s[i]+s[j]+s[l]
        
        //print("\(s[i]) \(s[j]) \(s[l])")
        
        if t == 0 {
            r.append([s[i], s[j], s[l]])
            n2()
        }
        else if t<0 {
            if l<c-1 { l+=1 }
            else { n2() }
        }
        else { n2() }
    }
    
    return r
}

struct triplette : Hashable, Equatable {
    let array: [Int]
    
    init(_ a: Int, _ b: Int, _ c: Int) {
        array = [a, b, c].sorted()
    }
    
//    var hashValue : Int {
//        return String(describing: self.array.map { UnicodeScalar(1000 + $0) }).hashValue
//    }
    var hashValue: Int {
        return self.array.reduce(5381) {
            ($0 << 5) &+ $0 &+ Int($1)
        }
    }


    static func ==(lhs: triplette, rhs: triplette) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}


func findTripletteCubic(_ a: [Int]) -> [[Int]] {
    guard a.count > 2 else { return [[Int]]() }
    
    var r = Set<triplette>()

    for i in a {
        for j in a {
            for l in a {
                if i != j && i != l && j != l && i+j+l == 0 {
                    r.insert(triplette(i, j, l))
                }
            }
        }
    }
    
    return r.map { $0.array }
}

print(findTripletteCubic([5, -3, 0, 4, -2, 1, -1, 2, 3]))
print(findTriplette([5, -3, 0, 4, -2, 1, -1, 2, 3]))

