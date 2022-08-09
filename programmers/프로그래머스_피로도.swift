import Foundation

var visited = [Bool]()
var d = [[Int]]()
var result = 0

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    visited = Array(repeating: false, count: dungeons.count)
    d = dungeons
    
    for i in 0..<d.count {
        visited[i] = true
        dfs(d[i], 1, k)
        visited[i] = false
    }
    
    return result
}

func dfs(_ dungeon: [Int], _ cnt: Int, _ k: Int) {
    if k < dungeon[0] {
        return
    }

    result = max(result,cnt)
    for i in 0..<d.count {
        if visited[i] {
            continue
        }
        visited[i] = true
        dfs(d[i], cnt+1, k-dungeon[1])
        visited[i] = false
    }
}