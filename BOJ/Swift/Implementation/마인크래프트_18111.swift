import Foundation

var nmb = readLine()!.components(separatedBy: " ").map{ Int($0)! }
var map = [Int]()
var height = [Int]()
for _ in 0..<nmb[0] {
    let m = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    m.forEach {
        if height.contains($0) {
            return
        } else {
            height += [$0]
        }
    }
    map += m
}
var result = [[Int]]()
var blocks = nmb[2]
var time = 0

for h in height.min()!...height.max()! {
    for i in map.indices {
        
        if map[i] == h {
            continue
        } else if map[i] > h {
            time += 2*(map[i]-h)
            blocks += map[i]-h
        } else if map[i] < h {
            time += h-map[i]
            blocks -= h-map[i]
        }
        
    }
    
    if blocks >= 0 {
        result += [[time, h]]
    }
    
    blocks = nmb[2]
    time = 0
}

result = result.sorted{ ($0[0], $0[1]) < ($1[0], $1[1]) }.sorted{ if $0[0] == $1[0] {
    return $0[1] > $1[1]
}
    return false
}

print(result[0][0], result[0][1])
