import Foundation

func solution(_ n:Int) -> Int {
    var arr = Array<Int>(0...n)
    
    for i in 2...n {
        for j in stride(from: i*i, to: n+1, by:i) {
            arr[j] = 0
        }
    }
    var result = arr.filter { $0 != 0 }
    result.removeFirst()
    return result.count
}