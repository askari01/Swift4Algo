import Foundation

class Tries {
    var value: Character?
    var final: Bool
    var childs: [Tries]
    
    init (value: Character? = nil) {
        self.value = value
        self.final = false
        self.childs = [Tries]()
    }
    
    func add(_ string: String) {
        guard string.count > 0 else { return }
        
        let i = string[string.startIndex]
        var child: Tries!
        
        if let pos = childs.index(where: {$0.value == i}) {
            child = childs[pos]
        }
        else {
            child = Tries(value: i)
            childs.append(child)
        }
        
        if string.count > 1 {
            let remaining = String(string[string.index(after: string.startIndex)...])
            child.add(remaining)
        }
        else {
            child.final = true
        }
    }
    
    func countFinal() -> Int {
        var count = 0
        for child in childs {
            if child.final {
                count += 1
            }
            count += child.countFinal()
        }
        
        return count
    }
    
    
    func find(_ string: String) -> Int {
        guard string.count > 0 else { return 0 }
        
        let i = string[string.startIndex]
        
        if let pos = childs.index(where: {$0.value == i}) {
            if string.count > 1 {
                let remaining = String(string[string.index(after: string.startIndex)...])
                return childs[pos].find(remaining)
            }
            else {
                return countFinal()
            }
        }
        
        return 0
    }
}

var t = Tries()

t.add("hack")
t.add("hackerrank")
t.find("hac")
t.find("hak")
