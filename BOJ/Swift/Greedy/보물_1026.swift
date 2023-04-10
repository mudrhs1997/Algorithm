import Foundation


let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
let b = Array(readLine()!.split(separator: " ").map{Int($0)!}.sorted().reversed())
var result = 0

for i in 0..<n {
    result += a[i]*b[i]
}

print(result)