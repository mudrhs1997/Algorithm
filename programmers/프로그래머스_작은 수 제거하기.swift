import Foundation

var arr = [4,3,2,1]
var result = [Int]();
var sotedArr = arr.sorted(by: >)
let min = sotedArr.removeLast()

for i in arr {
    if min != i {
        result.append(i)
    }
}

if result.isEmpty {
    result.append(-1)
    print(result)
} else {
    print(result)
}
