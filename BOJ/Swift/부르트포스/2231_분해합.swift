import Foundation

let n = Int(readLine()!)!
var result = [Int]()

for i in 1...1000000 {
    var cal = "\(i)"
    let cnt = cal.count
    var sum = Int(cal)!
    for _ in 0..<cnt {
        sum += Int(String(cal.removeFirst()))!
    }
    if sum == n {
        result.append(i)
        break
    }
}

if result.isEmpty {
    print(0)
} else {
    print(result[0])
}

