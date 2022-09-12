import Foundation

var board = [Bool]()
var visited = [[Int]]()
var result = 0

func solution(_ n:Int) -> Int {
    board = Array(repeating: false, count: n)
    for i in 0..<n {
        board[i] = true
        visited += [[0,i]]
        dfs(1, n)
        board[i] = false
        visited.removeLast()
    }
    
    return result
}

func dfs(_ idx: Int, _ n: Int) {
    if idx == n {
        result += 1
        return
    }
    for i in 0..<n {
        if board[i] {
            continue
        }
        if !check([idx,i]) {
            continue
        } else {
            board[i] = true
            visited += [[idx,i]]
            dfs(idx+1, n)
            visited.removeLast()
            board[i] = false
        }
        
    }
}

func check(_ point: [Int]) -> Bool {
    for visit in visited {
        if abs(visit[0]-point[0]) == abs(visit[1]-point[1]) {
            return false
        }
    }
    return true
}