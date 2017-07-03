import Foundation

class Tree<T:Comparable> {
    var value:T
    var left:Tree? {
        didSet {
            left?.parent = self
        }
    }
    var right:Tree? {
        didSet {
            right?.parent = self
        }
    }
    var parent:Tree?
    
    init(_ value:T) {
        self.value = value
    }
    
    func checkBST(_ last: inout T) -> Bool {
        if left != nil && !left!.checkBST(&last) {
            return false
        }
        
        if (value <= last) {
            return false;
        }
        else {
            last = value;
        }
        
        if right != nil && !right!.checkBST(&last) {
            return false
        }
        
        return true;
    }
}

//          4
//    2           6
// 1     3     5     7
var t = Tree<Int>(4)
t.left = Tree<Int>(2)
t.left!.left = Tree<Int>(1)
t.left!.right = Tree<Int>(3)
t.right = Tree<Int>(6)
t.right!.left = Tree<Int>(5)
t.right!.right = Tree<Int>(7)

var last = -1
t.checkBST(&last)
