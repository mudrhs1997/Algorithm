import Foundation

let n = Int(String(readLine()!))!
let hash = String(readLine()!)
var result = 0
var idx = 0.0
var p = 1
hash.forEach { c in
    result = (result + Int((c.asciiValue!-96))*p) % 1234567891
    p = (p*31) % 1234567891
    idx += 1
}

print(result)

