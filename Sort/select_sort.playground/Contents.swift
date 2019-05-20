import Foundation


func selectionSort<T: Comparable>(targets: [T], expression: ((_ lhs: T, _ rhs: T) -> Bool)) -> [T] {
    
    let targetsCount = targets.count
    var result: [T] = targets
    targets.enumerated().forEach { currentTargetIndex, _ in
        var tmpIndex: Int?
        var candidate: T = result[currentTargetIndex]

        for index in currentTargetIndex ..< targetsCount where result[index] > candidate {
              candidate = result[index]
              tmpIndex = index
        }
        
        if let i = tmpIndex {
            result.swapAt(currentTargetIndex, i)
        }
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

let targets = makeRamdomUniqueIntArray(count: 1000)
//print(targets)

print("selectionSort")
measure {
    let hoge = selectionSort(targets: targets) { $0 < $1 }
    print(hoge)
}

print("Sort of the standard library")
measure {
    let foo = targets.sorted()
    print(foo)
}

