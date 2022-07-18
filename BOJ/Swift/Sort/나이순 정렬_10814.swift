import Foundation

let n = Int(String(readLine()!))!
var user = [(Int, String)]()
for _ in 0..<n {
    let u = readLine()!.components(separatedBy: " ")
    user.append((Int(u[0])!, u[1]))
}

let result = user.sorted(by: { a, b in
    a.0<b.0
})

for i in 0..<result.count {
    print(result[i].0, result[i].1)
}
