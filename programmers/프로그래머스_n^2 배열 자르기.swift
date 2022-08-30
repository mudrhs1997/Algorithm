import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var start = [(left)/Int64(n),(left)%Int64(n)]
    let end = [(right)/Int64(n),(right)%Int64(n)]
    var num: Int64 = 0
    if start[1]<start[0] {
        num = start[0]+1
    } else {
        num = start[1]+1
    }
    var answer = [Int]()
    for _ in 0..<right-left+1 {
        answer += [Int(num)]
        if num == n || start[1] < start[0] {
            start[1] += 1
        } else {
            start[1] += 1
            num += 1
        }
        if start[1] > n-1 {
            start[0] += 1
            start[1] = 0
            num = start[0]+1
        }
    }
    return answer
}