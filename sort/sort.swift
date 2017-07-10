import Foundation
#if os(Linux)
    import Glibc
#endif

//import QuartzCore
//UTILITY
//func executionTime(block: ()->()) -> CFTimeInterval {
//    let start = CACurrentMediaTime()
//    block()
//    let end = CACurrentMediaTime()
//    return end - start
//}
func executionTime(block: ()->()) -> TimeInterval {
    let start = Date()
    block()
    return Date().timeIntervalSince(start)
}

extension RandomAccessCollection {
    func random() -> Iterator.Element? {
        guard count > 0 else { return nil }
        let offset = arc4random_uniform(numericCast(count))
        let i = index(startIndex, offsetBy: numericCast(offset))
        return self[i]
    }
}


func createRandomIntArray(_ n: Int)  -> [Int] {
    var array = Array<Int>()
    
    for _ in 0..<n {
        var notFound = false
        repeat {
            if let r = (0..<n).random() {
                if array.index(of: r) == nil {
                    notFound = true
                    array.append(r)
                }
            }
        } while notFound == false
    }
    
    return array
}



//STACK ARRAY
struct Stack<T> {
    
    var stack = [T]()
    var count:Int { return stack.count }
    
    mutating func push(_ value: T) {
        stack.insert(value, at: 0)
    }
    
    mutating func pop() -> (T?) {
        return stack.remove(at: 0)
    }
}

extension Stack: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        var curr = self
        return AnyIterator { curr.pop() }
    }
}

//QUEUE ARRAY
struct Queue<T> {
    
    var queue:[T] = []
    var count:Int { return queue.count }
    
    mutating func enqueue(_ value: T) {
        queue.append(value)
    }
    
    mutating func dequeue() -> (T?) {
        return queue.count > 0 ? queue.remove(at: 0) : nil
    }
    
    func head() -> (T?) {
        return queue.count > 0 ? queue[0] : nil
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
}

extension Queue: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        var curr = self
        return AnyIterator { curr.dequeue() }
    }
}

//HEAP
typealias Heap<T: Comparable> = PriorityQueue<T>
struct PriorityQueue<T: Comparable> {
    
    var queue:[T] = []
    var count:Int { return queue.count }
    
    init() {}
    
    init(fromArray:[T]) {
        queue = fromArray
        
        for i in stride(from: queue.count-1, to: -1, by: -1) {
            boubleDown(i)
        }
    }
    
    mutating func enqueue(_ value: T) {
        queue.append(value)
        
        var pos = queue.count - 1
        while true {
            let par = parent(pos)
            if par >= 0 && queue[par] > queue[pos] {
                let tmp = queue[par]
                queue[par] = queue[pos]
                queue[pos] = tmp
                pos = par
            }
            else {
                break
            }
        }
    }
    
    mutating internal func boubleDown(_ pos: Int) {
        var minChildPos = left(pos)
        
        if minChildPos < queue.count {
            let rightPos = right(pos)
            
            if rightPos < queue.count {
                if queue[rightPos] < queue[minChildPos] {
                    minChildPos = rightPos
                }
            }
            
            if queue[pos] > queue[minChildPos] {
                let tmp = queue[pos]
                queue[pos] = queue[minChildPos]
                queue[minChildPos] = tmp
                
                boubleDown(minChildPos)
            }
        }
    }
    
    mutating func dequeue() -> (T?) {
        let top:T? = queue.count > 0 ? queue[0] : nil
        
        if top != nil {
            let lastValue = queue.remove(at: queue.count - 1)
            
            if queue.count > 0 {
                queue[0] = lastValue
                
                boubleDown(0)
            }
        }
        
        return top
    }
    
    func peek() -> (T?) {
        return queue.count > 0 ? queue[0] : nil
    }
    
    internal func left(_ n: Int) -> Int {
        return 2 * n + 1
    }
    
    internal func right(_ n: Int) -> Int {
        return 2 * n + 2
    }
    
    internal func parent(_ n: Int) -> Int {
        return (n - 1) / 2
    }
}



//SORT
extension Array where Element : Comparable {
    internal mutating func swap(_ a: Int, _ b: Int) {
        if a != b {
            (self[a], self[b]) = (self[b], self[a])
        }
    }
    
    //n
    func isSorted() -> Bool {
        for i in 0..<self.count-1 {
            if self[i] > self[i+1] {
                return false
            }
        }
        return true
    }
    
    //nlogn
    func binarySearch(_ element: Element) -> Bool {
        guard self.count > 0 else {
            return false
        }
        
        let middle = self.count / 2
        let middleElement = self[middle]
        
        if element == middleElement {
            return true
        }
        else if element < middleElement {
            return Array(self[0..<middle]).binarySearch(element)
        }
        else {
            return Array(self[middle+1..<self.count]).binarySearch(element)
        }
    }
    
    
    //nˆ2
    mutating func bubbleSort() {
        for i in 0..<self.count {
            for j in i+1..<self.count {
                if self[j] < self[i] {
                    swap(i, j)
                }
            }
        }
    }
    
    //nˆ2
    mutating func selectionSort() {
        for i in 0..<self.count {
            var min = i
            for j in i+1..<self.count {
                if self[j] < self[min] {
                    min = j
                }
            }
            if i != min {
                swap(i, min)
            }
        }
    }
    
    //nˆ2
    mutating func insertionSort() {
        for i in 0..<self.count {
            var j = i
            while j>0 && self[j] < self[j-1] {
                swap(j, j-1)
                j -= 1
            }
        }
    }
    
    //nlogn
    mutating func quickSort() {
        func partition(from: Int, to: Int) -> Int {
            let p = self[(from+to)/2] // or random
            //print("\(from)-\(to)=>\(p)")
            
            var left = from
            var right = to
            
            while left<=right {
                while self[left] < p {
                    left += 1
                }
                while self[right] > p {
                    right -= 1
                }
                
                if left<=right {
                    (self[left], self[right]) = (self[right], self[left])
                    left += 1
                    right -= 1
                }
            }
            
            return left
        }
        
        func quickSort(from: Int, to: Int) {
            if to-from > 0 {
                let p = partition(from: from, to: to)
                quickSort(from: from, to: p-1)
                quickSort(from: p, to: to)
            }
        }
        
        quickSort(from: 0, to: self.count-1)
    }
    
    
    //nlogn
    mutating func mergeSort()  {
        func mergeSort(low: Int, high: Int) {
            let middle = (low+high)/2
            
            if high-low > 1 {
                mergeSort(low: low, high: middle)
                mergeSort(low: middle+1, high: high)
            }
            merge(low: low, middle: middle, high: high)
        }
        func merge(low: Int, middle: Int, high: Int) {
            guard low != middle || middle != high else {
                return
            }
            
            var leftQ = Queue<Element>()
            var rightQ = Queue<Element>()
            
            for i in low...middle {
                leftQ.enqueue(self[i])
            }
            for i in middle+1...high {
                rightQ.enqueue(self[i])
            }
            
            var i = low
            while !leftQ.isEmpty() && !rightQ.isEmpty() {
                if leftQ.head()! < rightQ.head()! {
                    self[i] = leftQ.dequeue()!
                }
                else {
                    self[i] = rightQ.dequeue()!
                }
                i += 1
            }
            while let left =  leftQ.dequeue() {
                self[i] = left
                i += 1
            }
            while let right =  rightQ.dequeue() {
                self[i] = right
                i += 1
            }
        }
        
        mergeSort(low: 0, high: self.count-1)
    }
    
    //nlogn
    mutating func heapSort() {
        var heap = PriorityQueue<Element>(fromArray: self)
        
        var i = 0
        while let e = heap.dequeue() {
            self[i] = e
            i += 1
        }
    }
}

extension Array where Element ==  Int {
    //n
    //bucketSort (only for Int array)
    mutating func bucketSort(maxValue: Int) {
        var bucketArray = Array<Int>(repeating: 0, count: maxValue)
        
        for i in 0..<self.count {
            bucketArray[self[i]] += 1
        }
        
        var pos = 0
        for i in 0..<bucketArray.count {
            if bucketArray[i] > 0 {
                for _ in 0..<bucketArray[i] {
                    self[pos] = i
                    pos += 1
                }
            }
        }
    }
    
    //nlogn
    //radixSort
    mutating func radixSort() {
        var divide = 1
        var big=0
        
        while true {
            var bucketArray = Array<[Int]>(repeating: [Int](), count: 10)
            
            for i in 0..<self.count {
                let n = self[i]
                bucketArray[n / divide % 10].append(n)
                if n > big {
                    big = n
                }
            }
            
            var pos = 0
            for bucket in bucketArray {
                for i in bucket {
                    self[pos] = i
                    pos += 1
                }
            }
            
            if big < divide * 10 {
                break
            }
            
            divide *= 10
        }
    }
}



//TEST


typealias SortFunction = (inout [Int]) -> () -> ()

let arraySize = 100

func sortTest(testName: String, arraySize: Int, sortF: @escaping SortFunction) -> Bool {
    var array:Array<Int> = createRandomIntArray(arraySize)
    let t = executionTime { sortF(&array)() }
    let s = array.isSorted()
    
    if let r = (0..<array.count).random() {
        let c = array.binarySearch(r)
        
        print("\(testName) - result: \(s)  check: \(c)  in: \(t)")
        
        return c
    }
    return false
}

func bucketsortTest(testName: String, arraySize: Int) -> Bool {
    var array:Array<Int> = createRandomIntArray(arraySize)
    let t = executionTime { array.bucketSort(maxValue: arraySize) }
    let s = array.isSorted()
    
    if let r = (0..<array.count).random() {
        let c = array.binarySearch(r)
        
        print("\(testName) - result: \(s)  check: \(c)  in: \(t)")
        
        return c
    }
    return false
}


bucketsortTest(testName: "bucketSort", arraySize: arraySize)
sortTest(testName: "radixSort", arraySize: arraySize, sortF: Array<Int>.radixSort)
sortTest(testName: "quickSort", arraySize: arraySize, sortF: Array<Int>.quickSort)
sortTest(testName: "heapSort", arraySize: arraySize, sortF: Array<Int>.heapSort)
sortTest(testName: "mergeSort", arraySize: arraySize, sortF: Array<Int>.mergeSort)
sortTest(testName: "selectionSort", arraySize: arraySize, sortF: Array<Int>.selectionSort)
sortTest(testName: "insertionSort", arraySize: arraySize, sortF: Array<Int>.insertionSort)
sortTest(testName: "bubbleSort", arraySize: arraySize, sortF: Array<Int>.bubbleSort)

