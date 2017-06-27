import Foundation

enum DeepFirstTraversalOrder {
    case InOrder
    case PreOrder
    case PostOrder
}

class Tree<T> {
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
    
    // Deep First Traversal
    func dft(_ order: DeepFirstTraversalOrder) {
        switch order {
        case .InOrder:
            left?.dft(order)
            print(value)
            right?.dft(order)
        case .PreOrder:
            print(value)
            left?.dft(order)
            right?.dft(order)
        case .PostOrder:
            right?.dft(order)
            print(value)
            left?.dft(order)
        }
    }
    
    func bft() {
        var q = [Tree]()
        q.append(self)
        
        while q.count > 0 {
            let t = q.remove(at: 0)
            print(t.value)
            if let l = t.left {
                q.append(l)
            }
            if let r = t.right {
                q.append(r)
            }
        }
    }
    
    func lowestAncestor(a: Tree, b: Tree) -> Tree {
        func commonElementIn(_ aArray: [Tree], _ bArray: [Tree]) -> Tree? {
            for a in aArray {
                for b in bArray {
                    if a === b {
                        return a
                    }
                }
            }
            return nil
        }
        
        var aParents = [Tree]()
        var bParents = [Tree]()
            
        var aI:Tree? = a
        var bI:Tree? = b
            
        while aI != nil || bI != nil {
            if let rAI = aI {
                aParents.append(rAI)
            }
            if let rBI = bI {
                bParents.append(rBI)
            }
            
            if let p = commonElementIn(aParents, bParents) {
                return p
            }
            
            aI = aI?.parent
            bI = bI?.parent
        }
        
        return self
    }
    
    func path(to: Tree) -> String? {
        var path:String?
        
        if self === to {
            path = "\(self.value) "
        }
        else if let f = left?.path(to: to) {
            path = "\(self.value) - \(f)"
        }
        else if let f = right?.path(to: to) {
            path = "\(self.value) - \(f)"
        }
        
        return path
    }
    
    
    func path(from: Tree, to: Tree) -> String {
        guard from !== to else { return "" }
        
        var path = String()
        let ancestor = lowestAncestor(a: from, b: to)
        
        path = "\(from.value) - "
        var fromP = from.parent
        while fromP != nil && fromP !== ancestor {
            path += "\(fromP!.value) - "
            fromP = fromP?.parent
        }
        if let f = ancestor.path(to: to) {
            path += f
        }
        
        return path
    }
}

var t = Tree<Int>(17)
t.left = Tree<Int>(6)
t.left!.left = Tree<Int>(3)
t.left!.left!.left = Tree<Int>(1)
t.left!.right = Tree<Int>(12)
t.left!.right!.left = Tree<Int>(9)
t.left!.right!.right = Tree<Int>(15)
t.right = Tree<Int>(46)
t.right!.right = Tree<Int>(56)
t.right!.right!.left = Tree<Int>(48)

//                                     17
//                   6                                    46
//         3               12                                        56
// 1                   9         15                          48

//t.dft(.InOrder)
//t.bft()

var la = t.lowestAncestor(a: t.left!.left!.left! , b: t.left!.right!.right!) // 1 & 15
print("Lowst Ancestor 1 & 15 = \(la.value)")
print("path 1 -> 15 = \(t.path(from: t.left!.left!.left! , to: t.left!.right!.right!) )")

la = t.lowestAncestor(a: t.left!.right!.right! , b: t.right!.right!.left!) // 15 && 48
print("Lowst Ancestor 15 & 48 = \(la.value)")
print("path 15 -> 48 = \(t.path(from:  t.left!.right!.right! , to: t.right!.right!.left!) )")

