import Foundation

// left <= self <= right
class BST<T: Comparable> {
    let value: T
    var left: BST<T>?
    var right: BST<T>?
    
    init(_ value: T) {
        self.value = value
    }
    
    func add(_ value: T) {
        if value <= self.value {
            if let l = left  {
                l.add(value)
            }
            else {
                left = BST<T>(value)
            }
        }
        else {
            if let r = right  {
                r.add(value)
            }
            else {
                right = BST<T>(value)
            }
        }
    }
}

//Create BST
//                ( 5 )
//                /     \
//             (3)     (8)
//             /  \     /  \
//         (1)  (4) (7)  (12)
//                            /
//                     (10)
//                      /  \
//                  (9)  (11)

var b = BST<Int>(5)
b.add(3)
b.add(8)
b.add(1)
b.add(4)
b.add(7)
b.add(12)
b.add(10)
b.add(9)
b.add(11)

b.value
b.left?.value
b.right?.value
b.left?.left?.value
b.left?.right?.value
b.right?.left?.value
b.right?.right?.value
b.right?.right?.left?.value
b.right?.right?.left?.left?.value
b.right?.right?.left?.right?.value

extension BST  {
    func greatestInBST(lastParent: inout BST) -> BST {
        if let r = right {
            lastParent = self
            return r.greatestInBST(lastParent: &lastParent)
        }
        else {
            return self
        }
    }
    
    func secondGreatestInBST() -> BST? {
        var lastParent = self
        var secondLast: BST?
        
        let greatest = greatestInBST(lastParent: &lastParent)
        
        if let l = greatest.left {
            secondLast = l.greatestInBST(lastParent: &lastParent)
        }
        else {
            secondLast = lastParent
        }
        
        return secondLast
    }
}

b.secondGreatestInBST()?.value

