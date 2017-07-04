import Foundation

struct Stack<T> {
    var array = Array<T>()
    
    mutating func push(_ value: T) {
        //array.insert(value, at: 0)
        array.append(value)
    }
    
    mutating func pop() -> T? {
        guard array.count > 0 else { return nil }
        //return array.remove(at: 0)
        return array.remove(at: array.count - 1)
    }
    
    var count: Int { return array.count }
}

struct QueueWith2Stacks<T> {
    var inbox = Stack<T>()
    var outbox = Stack<T>()
    
    mutating func enqueue(_ value: T) {
        inbox.push(value)
    }
    
    mutating func dequeue() -> T? {
        if outbox.count > 0 {
            return outbox.pop()
        }
        else {
            while let x = inbox.pop() {
                outbox.push(x)
            }
            return outbox.pop()
        }
    }
}

var q = QueueWith2Stacks<Int>()

q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.dequeue()
q.enqueue(4)
q.dequeue()
q.dequeue()
q.enqueue(5)
q.enqueue(6)
q.dequeue()
q.dequeue()
q.dequeue()
q.dequeue()
q.dequeue()
q.dequeue()

