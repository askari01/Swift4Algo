// LRU Cache: Implement a Last Recently Used Key Value Cache

import Foundation

class DoubleList<K: Hashable, V> {
    var key: K
    var value: V
    var next: DoubleList?
    var prev: DoubleList?

    init(key: K, value: V) {
        self.key = key
        self.value = value
    }
}

struct mruCache<K: Hashable, V> {
    var map: Dictionary<K, DoubleList<K,V>>
    var head: DoubleList<K,V>?
    var last: DoubleList<K,V>?
    var size: Int
    
    init(size: Int) {
        self.size = size
        map = Dictionary<K, DoubleList<K,V>>()
    }
 
    mutating func set(key: K, value: V) {
        if let exist = map[key] {
            exist.value = value
            touch(key: key)
        }
        else {
            map[key] = DoubleList(key: key, value: value)

            let o = head
            head = map[key]
            head!.next = o
            head!.prev = nil
            head!.next?.prev = head
            
            if last == nil {
                last = head
            }
            
            if let l = last, map.count > size {
                last = l.prev
                last!.next = nil
                map.removeValue(forKey: l.key)
            }
        }
    }
    
    mutating func get(key: K) -> V? {
        touch(key: key)
        return map[key]?.value
    }
    
    mutating internal func touch(key: K) {
        if map.count > 1, let c = map[key], let o = head {
            if c === last {
                last = c.prev
            }
            
            c.prev?.next = c.next
            c.next?.prev = c.prev
            head = c
            c.next = o
            c.prev = nil
            o.prev = c
        }
    }
}



var cache = mruCache<String, String>(size: 3)
for i in 1...5 {
    print("- insert \(i)")
    cache.set(key: String(i), value: String(i))
    print("   head: \(cache.head?.value ?? "nil")")
    print("   last: \(cache.last?.value ?? "nil")")
}

print("- get 2 \(cache.get(key: "2") ?? "nil")")
print("   head: \(cache.head?.value ?? "nil")")
print("   last: \(cache.last?.value ?? "nil")")
print("- get 4 \(cache.get(key: "4") ?? "nil")")
print("   head: \(cache.head?.value ?? "nil")")
print("   last: \(cache.last?.value ?? "nil")")
print("- get 3 \(cache.get(key: "3") ?? "nil")")
print("   head: \(cache.head?.value ?? "nil")")
print("   last: \(cache.last?.value ?? "nil")")
print("- get 3 \(cache.get(key: "3") ?? "nil")")
print("   head: \(cache.head?.value ?? "nil")")
print("   last: \(cache.last?.value ?? "nil")")
print("- insert 6")
cache.set(key: "6", value: "6")
print("   head: \(cache.head?.value ?? "nil")")
print("   last: \(cache.last?.value ?? "nil")")
print("expexted size = \(cache.size)  real size = \(cache.map.count)")
