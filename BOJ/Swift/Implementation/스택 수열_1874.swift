import Foundation

let n = Int(String(readLine()!))!
var arr = [Int]()
var result = [String]()
var isPossible = true
var idx = 0
var num = 0
for _ in 0..<n {
    num = Int(String(readLine()!))!
    if idx < num {
        for i in idx+1...num {
            arr += [i]
            result += ["+"]
        }
        idx = num
    }
    if arr.last == num {
        arr.removeLast()
        result += ["-"]
    } else {
        print("NO")
        isPossible = false
        break
    }
}

if isPossible {
    for i in result {
        print(i)
    }
}
