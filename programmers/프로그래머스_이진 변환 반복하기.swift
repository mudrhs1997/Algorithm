import Foundation

func solution(_ s:String) -> [Int] {
    var answer = [0,0]
    var newNum = s
    var beforeCount = 150000
    var afterCount = 150000
    while afterCount != 1 {
        beforeCount = newNum.count
        afterCount = newNum.filter{$0=="1"}.count
        newNum = String(afterCount,radix:2)
        answer[0] += 1
        answer[1] += beforeCount - afterCount
        
    }
    return answer
}