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
    
    while i<c && j<c && l<c {
        let t = s[i]+s[j]+s[l]
        if t == 0 {
            r.append([s[i], s[j], s[l]])
            n()
        }
        else if t<0 {
            if l<c-1 { l+=1 }
            else if j<c-1 { j+=1; l=j+1 }
            else { n() }
        }
        else {break}
    }
    
    return r
}

print(findTriplette([5, -3, 0, 4, -2, 1, -1, 2, 3]))

