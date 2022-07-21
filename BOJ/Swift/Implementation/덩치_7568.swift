import Foundation

let n = Int(String(readLine()!))!
var person = [[Int]]()
var result = Array(repeating: "", count: n)
var cnt = 1
for _ in 0..<n {
    person += [readLine()!.components(separatedBy: " ").map{Int($0)!}]
}

for i in 0..<n {
    for j in 0..<n {
        if i == j {
            continue
        } else {
            if person[i][0] < person[j][0] && person[i][1] < person[j][1] {
                cnt += 1
            }
        }
    }
    result[i] = "\(cnt)"
    cnt = 1
}

print(result.joined(separator: " "))
