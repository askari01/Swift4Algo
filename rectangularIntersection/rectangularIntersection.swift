import Foundation

struct Rectangle: CustomStringConvertible {
    // coordinates of bottom left corner
    let leftX: Int
    let bottomY: Int
    
    // dimensions
    let width: Int
    let height: Int
    
    init(leftX: Int, bottomY: Int, width: Int, height: Int) {
        self.leftX = leftX
        self.bottomY = bottomY
        self.width = width
        self.height = height
    }
    
    init() {
        self.init(leftX: 0, bottomY: 0, width: 0, height: 0)
    }
    
    var description: String {
        return String(format: "(%d, %d, %d, %d)", leftX, bottomY, width, height)
    }
}

func rectangularIntersection(a: Rectangle, b: Rectangle) -> Rectangle? {
    struct Overlap {
        let startingPoint: Int
        let length: Int
    }
    
    func getOverlap(n1: Int, l1: Int, n2: Int, l2: Int) -> Overlap? {
        let maxN = max(n1, n2)
        let minL = min(n1+l1, n2+l2)
        
        guard maxN < minL else { return nil }
        
        return Overlap(startingPoint: maxN, length: minL - maxN)
    }
    
    guard let x = getOverlap(n1: a.leftX, l1: a.width, n2: b.leftX, l2: b.width) else { return nil }
    guard let y = getOverlap(n1: a.bottomY, l1: a.height, n2: b.bottomY, l2: b.height) else { return nil }
    
    return Rectangle(leftX: x.startingPoint, bottomY: y.startingPoint, width: x.length, height: y.length)
}

rectangularIntersection(a: Rectangle(leftX: 1, bottomY: 1, width: 3, height: 2), b: Rectangle(leftX: 3, bottomY: 2, width: 2, height: 3))
rectangularIntersection(a: Rectangle(leftX: 1, bottomY: 1, width: 3, height: 2), b: Rectangle(leftX: 3, bottomY: 0, width: 2, height: 2))
rectangularIntersection(a: Rectangle(leftX: 1, bottomY: 1, width: 3, height: 2), b: Rectangle(leftX: 2, bottomY: 0, width: 1, height: 2))


