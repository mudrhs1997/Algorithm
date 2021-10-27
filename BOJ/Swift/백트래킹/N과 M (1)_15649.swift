import Foundation

var input = readLine()!.components(separatedBy: " ")
let n = Int(input[0])!
let m = Int(input[1])!
let arr = Array(1...n)
var visit = Array(repeating: false, count: n)
var index = 1
var result = Array(repeating: 0, count: m)


func bt(_ m: Int, _ idx: Int) {
    for i in arr {
        if visit[i-1] == false {
            visit[i-1] = true
            result[index-1] = i
            if index == idx {
                print(result.map{String($0)}.joined(separator: " "))
                visit[i-1] = false
            } else {
                index += 1
                bt(n,idx)
                visit[i-1] = false
                index -= 1
            }
        }
    }
}

bt(n,m)


