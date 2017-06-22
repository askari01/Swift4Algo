import Foundation

class List<T> {
    var value: T
    var unique: UUID
    var next: List?
    
    init(_ value: T, next: List? = nil) {
        self.value = value
        self.unique = UUID()
        self.next = next
    }
    
    func add(_ value: T) -> List<T> {
        var l:List<T>? = self
        while l?.next != nil { l = l?.next }
        let newItem = List<T>(value)
        l?.next = newItem
        return newItem
    }
    
    func navigate(callback: (List<T>) -> Void) {
        var l:List<T>? = self
        repeat {
            callback(l!)
            l = l!.next
        }
        while l != nil
    }
    
    func isLooped() -> Bool {
        var lfast:List<T>? = self
        var lslow:List<T>? = self
        
        while lfast?.next != nil {
            lfast = lfast?.next?.next
            lslow = lslow?.next
            
            if lfast == nil || lslow == nil { break }
            
            if lfast?.unique == lslow?.unique {
                return true
            }
        }
        
        return false
    }
}

var linkedList = List<Int>(0)

var last:List<Int>?
for i in 1..<20 {
    last = linkedList.add(i)
}

print("closed cycle")
linkedList.navigate() {
    v in print("\(v.value) -> \(v.next?.value)")
}
print("is closed: \(linkedList.isLooped())")

print("add loop to the 5th")
last?.next = linkedList.next?.next?.next?.next
print("\(last?.value) -> \(last?.next?.value)")
print("is closed: \(linkedList.isLooped())")

