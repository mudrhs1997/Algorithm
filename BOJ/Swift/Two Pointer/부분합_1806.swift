import Foundation


let ns = readLine()!.split(separator: " ").map{ Int($0)! }
let arr = [0] + readLine()!.split(separator: " ").map{ Int($0)! }
var sumArr = [0]
var length = ns[0]+1
var idx = 0
for i in 1...ns[0] {
    let newSum = arr[i]+sumArr[i-1]
    sumArr.append(newSum)
    while newSum - sumArr[idx] >= ns[1] {
        length = min(i-idx, length)
        if i < idx {
            break
        }
        idx += 1
    }
}

print(length == ns[0]+1 ? 0 : length)