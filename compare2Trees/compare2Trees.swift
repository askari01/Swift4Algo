import Foundation

class Tree<T: Comparable> {
    var data: T
    
    var childs: [Tree] = []
    
    init(_ data: T) {
        self.data = data
    }
    
    func dfs(_ callback: (T) -> Void) {
        callback(data)
        for c in childs {
            c.dfs(callback)
        }
    }
    
    func bfs(_ callback: (T) -> Void) {
        var q: [Tree] = []
        
        q.append(self)
        
        while q.count > 0 {
            let t = q.remove(at: 0)
            for c in t.childs {
                q.append(c)
            }
            
            callback(t.data)
        }
    }
}


func compareDFSOrdered(a: Tree<String>, b: Tree<String>) -> Bool {
    guard a.data == b.data && a.childs.count == b.childs.count else { return false }
    
    var i = 0
    for c1 in a.childs {
        let c2 = b.childs[i]
        if !compareDFSOrdered(a: c1, b: c2) {
            return false
        }
        i += 1
    }
    
    return true
}


func compareDFSUnordered(a: Tree<String>, b: Tree<String>) -> Bool {
    guard a.data == b.data && a.childs.count == b.childs.count else { return false }
    
    for c1 in a.childs {
        var ret = false
        for c2 in b.childs {
            if compareDFSUnordered(a: c1, b: c2) {
                ret = true
                break
            }
        }
        if ret == false {
            return false
        }
    }
    
    return true
}


var a = Tree<String>("A")
a.childs.append(Tree<String>("A.1"))
a.childs.append(Tree<String>("A.2"))
a.childs[0].childs.append(Tree<String>("A.1.1"))
a.childs[0].childs.append(Tree<String>("A.1.2"))
a.childs[1].childs.append(Tree<String>("A.2.1"))
a.childs[1].childs.append(Tree<String>("A.2.2"))
a.childs[1].childs.append(Tree<String>("A.2.3"))

var b = Tree<String>("A")
b.childs.append(Tree<String>("A.1"))
b.childs.append(Tree<String>("A.2"))
b.childs[0].childs.append(Tree<String>("A.1.1"))
b.childs[0].childs.append(Tree<String>("A.1.2"))
b.childs[1].childs.append(Tree<String>("A.2.1"))
b.childs[1].childs.append(Tree<String>("A.2.2"))
b.childs[1].childs.append(Tree<String>("A.2.3"))

var c = Tree<String>("A")
c.childs.append(Tree<String>("A.1"))
c.childs.append(Tree<String>("A.2"))
c.childs[0].childs.append(Tree<String>("A.1.1"))
c.childs[0].childs.append(Tree<String>("A.1.2"))
c.childs[1].childs.append(Tree<String>("A.2.1"))
c.childs[1].childs.append(Tree<String>("A.2.3"))  // <= Swapped
c.childs[1].childs.append(Tree<String>("A.2.2"))  // <= Swapped


//a.dfs { print ($0) }
//print()
//b.dfs { print ($0) }
//print()
//c.dfs { print ($0) }
//a.bfs { print ($0) }

compareDFSOrdered(a: a, b: b)       // True
compareDFSOrdered(a: a, b: c)       // False
compareDFSUnordered(a: a, b: b)     // True
compareDFSUnordered(a: a, b: c)     // True

