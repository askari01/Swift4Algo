import Foundation

class Tree<T: Comparable> {
    let value: T
    
    var left: Tree?
    var right: Tree?
    
    init(_ value: T) {
        self.value = value
    }
    
    func checkIfBST(min: inout T) -> Bool {
        if let l = left, !l.checkIfBST(min: &min) {
            return false
        }
        
        if value <= min {
            return false
        }
        else {
            min = value
        }
        
        if let r = right, !r.checkIfBST(min: &min) {
            return false
        }
        
        return true
    }
    
    func checkIfBST2(completition: (T) -> Bool) -> Bool {
        if let l = left, !l.checkIfBST2(completition: completition) {
            return false
        }
        
        if !completition(value) {
            return false
        }
        
        if let r = right, !r.checkIfBST2(completition: completition) {
            return false
        }
        
        return true
    }
    
}

var top = Tree(4)
top.left = Tree(2)
top.right = Tree(6)
top.left!.left = Tree(1)
top.left!.right = Tree(3)
top.right!.left = Tree(5)
top.right!.right = Tree(7)

var min = -1
top.checkIfBST(min: &min)

min = -1
top.checkIfBST2{ value in
    if value <= min {
        return false
    }
    else {
        min = value
        return true
    }
}




