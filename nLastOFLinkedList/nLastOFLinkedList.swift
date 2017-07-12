import Foundation

class List<T> {
    var value: T
    var next: List<T>?
    
    init(_ value: T) {
        self.value = value
    }
    
    func nLastOFLinkedList(_ n: Int) -> List? {
        guard n > 0 else { return nil }
        
        var i = 0
        var last:List = self
        var this:List? = self
        while this != nil {
            i += 1
            if i > n {
                last = last.next!
            }
            this = this?.next
        }
        
        if i < n {
            return nil
        }
        
        return last
    }
    
    func printAll() {
        print("---")
        
        var e:List<T>? = self
        while e != nil {
            print(e!.value)
            e = e!.next
        }
        
        print("---")
    }
}


var forwardList = List<String>("A")
forwardList.next =  List<String>("B")
forwardList.next!.next =  List<String>("C")
forwardList.next!.next!.next =  List<String>("D")
forwardList.next!.next!.next!.next =  List<String>("E")

forwardList.printAll()
forwardList.nLastOFLinkedList(2)?.value

