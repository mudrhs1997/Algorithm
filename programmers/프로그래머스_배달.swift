import Foundation

var map = Array(repeating: Array(repeating:500001, count: 51), count: 51)
var visited = Array(repeating: false, count: 51)
var nearest = [Int]()
var length = [Int]()
var l = 0


func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    l = N
    for i in road {
        map[i[0]][i[1]] = map[i[0]][i[1]] > i[2] ? i[2] : map[i[0]][i[1]]
        map[i[1]][i[0]] = map[i[1]][i[0]] > i[2] ? i[2] : map[i[1]][i[0]]
    }
    length = Array(repeating:500001, count: l+1)
    length[1] = 0

    for _ in 0..<l {
        var node = 0
        var min = 500001
        for i in length.indices {
            if length[i] < min {
                if !visited[i] {
                    min = length[i]
                    node = i
                }
            }
        }
        find(node)
    }
    
    
    return length.filter{$0<=k}.count
}

func find(_ node: Int) {
    visited[node] = true
    for i in 1...l {
        if visited[i] {
            continue
        }
        if length[node]+map[node][i] < length[i] {
            length[i] = length[node]+map[node][i]
            
        }
    }
}
