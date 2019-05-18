import Foundation


func insertionSort<T: Comparable>(targets: [T], expression: ((_ lhs: T, _ rhs: T) -> Bool)) -> [T] {
    
    let targetsCount = targets.count
    var result: [T] = [targets[0]]
    parent: for currentTargetIndex in (1 ..< targetsCount) {
        let currentTarget = targets[currentTargetIndex]
        
        for insertIndex in 0 ..< result.count {
            if !expression(result[insertIndex], currentTarget) {
              result.insert(currentTarget, at: insertIndex) // 重い
            continue parent
            }
        }
        
        result.append(currentTarget)
        
    }
    return result
}

/* Utilities **/
func randomIndex(from count: Int) -> Int {
    let tmp = Int(arc4random() % UInt32( max(count, 1)))
    return max(tmp - 1, 0)
}

func makeRamdomUniqueIntArray(count: Int) -> [Int] {
    let range = Array((0..<count))
    var arr = range
    var result: [Int] = []
    range.forEach { _ in
        let index = randomIndex(from: arr.count)
        result.append(arr.remove(at: index))
    }
    return result
}

func measure(target: (() -> ())) {
    let start = Date()
    target()
    print(Date().timeIntervalSince(start))
}

let targets = makeRamdomUniqueIntArray(count: 100)
//print(targets)

print("InsertionSort")
measure {
    let hoge = insertionSort(targets: targets) { $0 < $1 }
    print(hoge)
}

print("Sort of the standard library")
measure {
    let foo = targets.sorted()
    print(foo)
}

