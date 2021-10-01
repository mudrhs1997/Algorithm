import Foundation

let x = 12

var num = String(x)
var sum = 0;

for _ in 0..<num.count {
    let a = num.removeFirst().wholeNumberValue!
    sum += a
}

let result = (x % sum == 0) ? true : false

