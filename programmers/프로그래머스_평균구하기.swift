import Foundation

let arr = [1,2,3,4]
var sum = 0
var result: Double = 0.0

for i in 0..<arr.count {
    sum += arr[i]
}

print(Double(sum)/Double(arr.count))
