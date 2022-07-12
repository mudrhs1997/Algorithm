import Foundation

let N = Int(readLine()!)!
var board = Array(repeating: Array(repeating: false, count: N), count: N)
var check = Array(repeating: false, count: N)
var point = [(Int, Int)]()

var count = 0

for x in board[0].indices {
    check[x] = true
    point.append((0,x))
    findQueen(1)
    check = Array(repeating: false, count: N)
    point = []
}

func findQueen(_ idx: Int) {
    if idx == N {
        count += 1
    } else {
        for i in board[idx].indices {
            if check[i] {
            } else if distance(point, (idx, i)) {
                
            } else {
                check[i] = true
                point.append((idx, i))
                findQueen(idx+1)
                point.removeLast()
                check[i] = false
            }
        }
    }
}

func distance(_ a: [(Int, Int)], _ b: (Int, Int)) -> Bool {
    var isRoute = false
    for p in a {
        if abs(p.0-b.0) == abs(p.1 - b.1) {
            isRoute = true
        }
    }
    return isRoute
}

print(count)
