import Foundation

class List<T> {
    var value: T
    var next: List<T>?
    
    init(_ value: T) {
        self.value = value
    }
    
    func reverseList() -> List {
        guard let n = next else { return self }
        guard n.next != nil else {
            n.next = self
            next = nil
            return n
        }

        var last:List<T>!
        var newNext:List<T>? = nil
        var this:List<T>? = self

        repeat {
            last = this!
            let oldNext = this!.next
            
            this!.next = newNext
            newNext = this
            this = oldNext
        }
        while this != nil
        
        return last
    }
    
    func printAll() {
        print("---")
        
        var e:List<T>? = self
        repeat {
            print(e!.value)
            e = e!.next
        }
        while e != nil
        
        print("---")
    }
}


var forwardList = List<String>("A")
forwardList.next =  List<String>("B")
forwardList.next!.next =  List<String>("C")
forwardList.next!.next!.next =  List<String>("D")
forwardList.next!.next!.next!.next =  List<String>("E")

forwardList.printAll()
forwardList.reverseList().printAll()

