import Foundation

var input = readLine()!.components(separatedBy: " ")
let n = Int(input[0])!
let m = Int(input[1])!
var index = 0
var cnt = 0
var result = Array(repeating: 0, count: m)
var str = ""


func bt(_ m: Int, _ idx: Int) {
    for i in cnt..<n {
        result[index] = i + 1
        if index == idx-1 {
            str += result.map{String($0)}.joined(separator: " ")
            str += "\n"
        } else {
            index += 1
            cnt = i
            bt(n,idx)
            index -= 1
        }
    }
}

bt(n,m)
print(str)
