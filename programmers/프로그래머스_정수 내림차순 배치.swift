import Foundation

func solution(_ n:Int64) -> Int64 {
    var arr = Array(String(n)).sorted(by: >)
    var result = ""
    for i in arr {
        result += String(i)
    }
    return Int64(result)!
}