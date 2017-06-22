import Foundation

func nInOrder(n: Int, array: inout [Int]) -> Int {
    func partition(from: Int, to: Int) -> Int {
        let pivot = array[from + Int(arc4random_uniform(UInt32(to - from)))]
        var left = from
        var right = to
        
        while left <= right  {
            while array[left] < pivot { left += 1 }
            while array[right] > pivot { right -= 1 }
            
            if left <= right {
                if left != right { (array[left], array[right]) = (array[right], array[left]) }
                left += 1
                right -= 1
            }
        }
        
        return left
    }
    
    func nInOrder(n: Int, from: Int, to: Int) -> Int {
        guard n >= from && n <= to else { return -1 }
        guard from < to else { return array[n] }
        
        let p = partition(from: from, to: to)
        if p > to {
            return array[n]
        }
            
        if n < p {
            return nInOrder(n: n, from: from, to: p-1)
        }
        else {
            return nInOrder(n: n, from: p, to: to)
        }
    }
    
    return nInOrder(n: n, from: 0, to: array.count - 1)
}


var array = [ 8, 0, 3, 9, 2, 14, 10, 27, 1, 5, 8, 4, 26 ] //[5, 4, 6, 7, 8, 3, 9,1, 0, 2]  //[5, 1, 4, 2, 3]
let pos = 6
let nOrdered = nInOrder(n: pos, array: &array)
print(array)
print(array.sorted())
print("The \(pos) ordered value is \(nOrdered)")

