import Foundation

let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let N = input[0]
let K = input[1]
var result = [Int]()
var arr = Array(1...N)
while !arr.isEmpty {
    for i in 1...K {
        if i == K {
            result.append(arr.removeFirst())
        } else {
            arr.append(arr.removeFirst())
        }
    }
}
print("<\(result.map{String($0)}.joined(separator: ", "))>")

