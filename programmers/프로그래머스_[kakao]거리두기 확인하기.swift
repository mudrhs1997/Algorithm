import Foundation

var room = [[[Character]]]()
var visited = Array(repeating: Array(repeating: false, count: 5), count:5)
var queue = [[Int]]()
let x = [1,-1,0,0]
let y = [0,0,1,-1]
var isFar = true
var endIdx = 0
var startIdx = 0

func solution(_ places:[[String]]) -> [Int] {
    var result = [Int]()
    for i in places {
        var place = [[Character]]()
        for j in i {
            var p = [Character]()
            for k in j {
                p += [k]
            }
            place += [p]
        }
        room += [place]
    }
    for r in room {
        for i in r.indices {
            for j in r[i].indices {
                if r[i][j] == "P" {
                    queue += [[i,j]]
                    for k in 0..<3 {
                        let s = startIdx
                        let e = endIdx
                        if s > e {
                            break
                        }
                        for f in s...e {
                            bfs(queue[f], r, k)
                        }
                    }

                }
                visited = Array(repeating: Array(repeating: false, count: 5), count:5)
                queue = []
                startIdx = 0
                endIdx = 0
            }
        }
        if isFar {
            result += [1]
        } else {
            result += [0]
        }
        isFar = true
    }

    return result
}

func bfs(_ idx: [Int], _ r: [[Character]], _ cnt: Int) {
    startIdx += 1
    if visited[idx[0]][idx[1]] {
        return
    }
    visited[idx[0]][idx[1]] = true
    if !isFar {
        return
    }
    if cnt != 0 && r[idx[0]][idx[1]] == "P" {
        isFar = false
        return
    }
    for i in 0..<4 {
        if idx[0]+y[i] < 0 || idx[0]+y[i] > 4 || idx[1]+x[i] < 0 || idx[1]+x[i] > 4 {
            continue
        }
        if visited[idx[0]+y[i]][idx[1]+x[i]] || r[idx[0]+y[i]][idx[1]+x[i]] == "X" {
            continue
        }
        queue += [[idx[0]+y[i],idx[1]+x[i]]]
        endIdx += 1
    }
}
