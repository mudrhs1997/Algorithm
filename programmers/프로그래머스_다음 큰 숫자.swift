import Foundation

func solution(_ n:Int) -> Int
{
    var result = n
    let nonzero = n.nonzeroBitCount

    while true {
        result += 1
        if result.nonzeroBitCount == nonzero {
            break
        }
    }
    return result
}