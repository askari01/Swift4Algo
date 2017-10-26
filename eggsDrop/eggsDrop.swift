//http://datagenetics.com/blog/july22012/index.html
//http://www.geeksforgeeks.org/dynamic-programming-set-11-egg-dropping-puzzle/


import Foundation

func twoEggDropSimplifiedProblem(floors: Int) -> Int {
    let eggs = 2
    // with 2 eggs:
    //       n (n+1) / 2  >=  floor
    //       n = (-1 - sqrt(1 - (4 * (floor*2*4*-1)))) / 2

    return Int(((-1.0 + sqrt(Double(1 - (floors * eggs * 4 * -1)))) / 2.0).rounded(.up))
}

//twoEggDropSimplifiedProblem(floors: 0)
//twoEggDropSimplifiedProblem(floors: 1)
//twoEggDropSimplifiedProblem(floors: 10)
//twoEggDropSimplifiedProblem(floors: 200)
//twoEggDropSimplifiedProblem(floors: 300)
//twoEggDropSimplifiedProblem(floors: 400)
//twoEggDropSimplifiedProblem(floors: 500)
//twoEggDropSimplifiedProblem(floors: 1000)


func eggDrop(eggs: Int, floors: Int) -> Int {
    guard floors > 1 && eggs > 1 else { return 0 }
    
    var eggsFloorsMatrix:[[Int]] = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: floors+1), count: eggs+1) //eggsFloorsMatrix[egg][floor]
    
    for floor in 0...floors {
        eggsFloorsMatrix[1][floor] = floor
    }

    eggsFloorsMatrix[2][1] = 1
    
    for egg in 2...eggs {
        for floor in 2...floors {
            var minimum = 10000000
            for visitedFloor in 1...floor {
                minimum = min(minimum, 1 + max(eggsFloorsMatrix[egg-1][visitedFloor-1], eggsFloorsMatrix[egg][floor-visitedFloor]))
            }
            
            eggsFloorsMatrix[egg][floor] = minimum
        }
    }

    
    return eggsFloorsMatrix[eggs][floors]
}

for f in 2...50 {
    let eggDropCount = eggDrop(eggs: 2, floors: f)
    let eggDropSimplifiedCount = twoEggDropSimplifiedProblem(floors: f)

    if eggDropCount != eggDropSimplifiedCount {
        print("error")
    }
}

for f in 2...50 {
    print("floor \(f) - \(eggDrop(eggs: 3, floors: f))")
}





