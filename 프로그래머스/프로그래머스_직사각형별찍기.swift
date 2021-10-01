import Foundation

let a = 5
let b = 3

var arr = [[String]](repeating: [String](repeating: "*", count: a), count: b)

for i in arr {
    let joinedarr = i.joined(separator: "")
    print(joinedarr)
}
