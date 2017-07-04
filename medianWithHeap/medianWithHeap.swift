import Foundation

struct Heap<T:Comparable> {
    enum Order {
        case max
        case min
    }
    
    var order: Order
    var queue = [T]()
    
    init(_ order: Order = Order.max) {
        self.order = order
    }
    
    var count: Int {
        return queue.count
    }
    
    var top: T? {
        return queue.count > 0 ? queue[0] : nil
    }
    
    mutating func boubleUp(_ n: Int) {
        if let p = parent(n) {
            if (order == .max &&  queue[n] < queue[p]) || (order == .min &&  queue[n] > queue[p]){
                (queue[p], queue[n]) = (queue[n], queue[p])
                boubleUp(p)
            }
        }
    }
    
    mutating func enque(_ value: T) {
        queue.append(value)
        boubleUp(queue.count - 1)
    }
    
    mutating func boubleDown(_ n: Int) {
        if let l = left(n) {
            var min = l
            if let r = right(n), (order == .max &&  queue[r] < queue[min]) || (order == .min &&  queue[r] > queue[min]) {
                min = r
            }
            if  (order == .max &&  queue[min] < queue[n]) || (order == .min &&  queue[min] > queue[n]) {
                (queue[min], queue[n]) = (queue[n], queue[min])
                boubleDown(min)
            }
        }
    }
    
    mutating func dequeue() -> T? {
        let t = top
        
        if t != nil {
            let last = queue.remove(at: queue.count - 1)
            if queue.count > 0 {
                queue[0] = last
                boubleDown(0)
            }
        }
        
        return t
    }
    
    func left(_ n: Int) -> Int? {
        let next = (2 * n) + 1
        guard next < queue.count else { return nil }
        return next
    }
    
    func right(_ n: Int) -> Int? {
        let next = (2 * n) + 2
        guard next < queue.count else { return nil }
        return next
    }
    
    func parent(_ n: Int) -> Int? {
        guard n > 0 else { return nil }
        return (n-1) / 2
    }
}


struct MedianWithHeap {
    var minHeap = Heap<Int>(.min)
    var maxHeap = Heap<Int>(.max)
    
    mutating func add(_ n: Int) -> Float {
        if minHeap.count == 0 || n < minHeap.top! {
            minHeap.enque(n)
        }
        else {
            maxHeap.enque(n)
        }
        
        if abs(minHeap.count - maxHeap.count) >= 2 {
            if minHeap.count < maxHeap.count {
                minHeap.enque(maxHeap.dequeue()!)
            }
            else {
                maxHeap.enque(minHeap.dequeue()!)
            }
        }
        
        if minHeap.count == maxHeap.count {
            return Float(minHeap.top! + maxHeap.top!) / 2
        }
        else if minHeap.count < maxHeap.count {
            return Float(maxHeap.top!)
        }
        else {
            return Float(minHeap.top!)
        }
    }
    
}

var m = MedianWithHeap()
m.add(12)
m.add(4)
m.add(5)
m.add(3)
m.add(8)
m.add(7)


