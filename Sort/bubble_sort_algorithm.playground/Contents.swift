import Foundation

func bubbleSort<T: Comparable>(targets: [T], expression: ((_ lhs: T, _ rhs: T) -> Bool)) -> [T] {
    var result = targets
    let count = targets.count
    
    (0 ..< count).forEach {
        for i in 0 ..< count - $0 {
            let next = (i + 1)
            if next == count {
                break
            }
            
            if !expression(result[i], result[next]) {
                result.swapAt(i, next)
            }
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




let targets = makeRamdomUniqueIntArray(count: 100)
//print(targets)

print("BubbleSort")
measure {
    let hoge = bubbleSort(targets: targets) { $0 < $1 }
    //print(hoge)
}

print("Sort of the standard library")
measure {
    let foo = targets.sorted()
    //print(foo)
}

