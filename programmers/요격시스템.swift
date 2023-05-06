import Foundation

func solution(_ targets:[[Int]]) -> Int {
    let sortedTargets = targets.sorted{$0[1]<$1[1]}
    var currentTarget = -1
    var result = 0
    for target in sortedTargets {
        if target[0] > currentTarget {
            result += 1
            currentTarget = target[1]-1
            continue
        }
    }
    return result
}