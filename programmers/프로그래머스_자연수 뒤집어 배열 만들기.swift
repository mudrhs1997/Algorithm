import Foundation

let n: Int64 = 50000000000000
var arr = Array(String(n)).map { Int(String($0))! }
var result = [Int]()
for i in arr.reversed() {
    result.append(i)
}
print(result)