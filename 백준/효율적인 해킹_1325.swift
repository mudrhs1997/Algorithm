import Foundation

// 답은 맞지만 시간초과 뜸

var vertex: Int
var edge: Int
var map: [[Int]] = Array(repeating: [], count: 10001)
var visit: [Int] = Array(repeating: 0, count: 10001)
var visited: [Bool] = Array(repeating: false, count: 10001)

var input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
vertex = input[0]
edge = input[1]

for _ in 0..<edge {
    input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    map[input[0]].append(input[1])
}

for i in 1..<map.count {
    visited = Array(repeating: false, count: 10001)
    dfs(start: i)
}
let max = visit.max()!

for (index, value) in visit.enumerated() {
    if (value == max) {
        print(index, terminator: " ")
    }
}

func dfs(start: Int) {
    visited[start] = true
    visit[start] += 1
    for i in map[start] {
        if !visited[i] {
            dfs(start: i)
        }
    }
}
