import Foundation

let n = Int(String(readLine()!))!
var point = [[Int]]()
for _ in 0..<n {
    point += [readLine()!.components(separatedBy: " ").map{Int($0)!}]
}

let result = point.sorted{$0[1] < $1[1]}.sorted{if $0[1] == $1[1] { return $0[0]<$1[0] } else { return false } }

result.forEach { r in
    print(r[0], r[1])
}
