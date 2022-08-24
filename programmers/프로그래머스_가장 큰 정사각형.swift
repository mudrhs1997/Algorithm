
import Foundation

var memo = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: 1001), count: 1001)

func solution(_ board:[[Int]]) -> Int {
    var answer = 0
    memo = board
    for i in board.indices {
        for j in board[i].indices {
            if board[i][j] == 1 {
                answer = max(answer,dp(j,i))
                
            }
        }
    }

    return answer*answer
}

func dp(_ idxX: Int, _ idxY: Int) -> Int {
    if idxX < 0 || idxY < 0 || memo[idxY][idxX] == 0 {
        return 0
    }
    if visited[idxY][idxX] {
        return memo[idxY][idxX]
    }
    
    memo[idxY][idxX] = min(dp(idxX-1,idxY-1),dp(idxX-1,idxY),dp(idxX,idxY-1))+1
    visited[idxY][idxX] = true
    
    return memo[idxY][idxX]
}