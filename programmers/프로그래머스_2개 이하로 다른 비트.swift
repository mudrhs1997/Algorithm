// 답지 봤음 다시 풀어보기

import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    var answer = [Int64]()
    numbers.forEach { num in
        answer += [check(num)]
        
    }
    
    return answer
}

func check(_ num: Int64) -> Int64 {
    let binaryNum = String(num,radix:2)
    if num % 2 == 0 {
        return num+1
    }
    if num % 2 == 1 {
        if num&(num+1) == 0 {
            return (num+1)+Int64(String(Int(binaryNum)!/10),radix:2)!
        } else {
            var arr = Array(binaryNum).map{String($0)}
            var idx = 0
            for i in arr.indices.reversed() {
                if arr[i] == "0" {
                    arr[i] = "1"
                    idx = i
                    break
                }
            }
            for i in idx+1...arr.count-1 {
                if arr[i] == "1" {
                    arr[i] = "0"
                    break
                }
            }
            return Int64(arr.joined(),radix:2)!
        }
    }
    return 0
}