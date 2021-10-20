import Foundation

let n = 987
var arr = Array(String(n)).map { Int(String($0))! }
var result = 0
for i in arr {
    result += i
}

print(result)