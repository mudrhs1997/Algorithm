import Foundation

var input = readLine()!.components(separatedBy: " ")
let n = Int(input[0])!
let m = Int(input[1])!
var cnt = 0
var visited = Array(repeating: false, count: n)
var index = 0
var result = Array(repeating: 0, count: m)


func bt(_ m: Int, _ idx: Int) {
    for i in cnt..<n {
        if visited[i] == false {
            visited[i] = true
            cnt = i
            result[index] = i+1
            if index == idx-1 {
                print(result.map{String($0)}.joined(separator: " "))
                visited[i] = false
            } else {
                index += 1
                bt(n,idx)
                visited[i] = false
                index -= 1
            }
        }
    }
}

bt(n,m)
