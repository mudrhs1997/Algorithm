import Foundation

var tree = Array(repeating: [Int](), count: 101)
var visited = Array(repeating: false, count: 101)
var cnt = 0
var idx = 0

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var answer = 99999
    while idx != n {
        for wire in wires.indices {
            if wire == idx {
                continue
            }
            tree[wires[wire][0]] += [wires[wire][1]]
            tree[wires[wire][1]] += [wires[wire][0]]
        }

        dfs(1)
        
        answer = min(answer, abs((n-cnt)-cnt))
        cnt = 0
        visited = Array(repeating: false, count: 101)
        tree = Array(repeating: [Int](), count: 101)
        idx += 1
    }
    
    return answer
}

func dfs(_ node: Int) {
    if visited[node] {
        return
    }
    visited[node] = true
    cnt += 1
    for i in tree[node] {
        dfs(i)
    }
}