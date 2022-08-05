import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var printed = Array(repeating: false, count: priorities.count)
    var cnt = 0
    var check = false
    
    while !check {
        for i in priorities.indices {
            var isPrinted = true
            if printed[i] {
                continue
            }
            for j in priorities.indices {
                if i == j {
                    continue
                }
                if printed[j] {
                    continue
                }
                if priorities[i] < priorities[j] {
                    isPrinted = false
                    break
                }
            }
            if isPrinted {
                printed[i] = true
                cnt += 1
                if i == location {
                    check = true
                    break
                }
            }
        }
    }
    
    return cnt
}