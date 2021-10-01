import Foundation

let numbers = [0,0,0]

let number: [String] = numbers.map { String($0) }

var sortedNumber:[String] = number.sorted {
    $0+$1 > $1+$0
}

var result = sortedNumber.joined()

if Int(result) == 0 {
    result = "0"
}



print(result)
