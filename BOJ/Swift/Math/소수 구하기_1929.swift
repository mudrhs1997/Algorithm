import Foundation

let mn = readLine()!.components(separatedBy: " ").map{Int($0)!}
var arr = [Int](0...1000000)
if mn[1] == 1 {
    print()
} else {
    for i in 2...1000000 {
        for j in stride(from: i*i, to: 1000001, by:i) {
            arr[j] = 0
        }
    }
    var result = arr.filter { $0 != 0 }
    result.removeFirst()
    result.forEach { num in
        if num >= mn[0] && num <= mn[1] {
            print(num)
        }
    }
}

