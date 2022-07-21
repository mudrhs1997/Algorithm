import Foundation

let kn = readLine()!.components(separatedBy: " ").map{Int($0)!}
var lan = [Int]()
for _ in 0..<kn[0] {
    lan += [Int(String(readLine()!))!]
}

var start = 1
var end = lan.max()!
var result = 0
while start - end <= 0 {
    let mid = (start+end)/2
    var sum = 0
    lan.forEach { l in
        sum += l/mid
    }
    if sum >= kn[1] {
        result = max(result,mid)
        start = mid + 1
    } else if sum < kn[1] {
        end = mid - 1
    }
}

print(result)
