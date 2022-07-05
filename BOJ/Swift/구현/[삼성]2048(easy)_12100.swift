import Foundation

let n = Int(String(readLine()!))!
var board = [[Int]]()
for _ in 0..<n {
    board.append(readLine()!.components(separatedBy: " ").map{ Int($0)! })
}
var isMerged = Array(repeating: Array(repeating: false, count: n), count: n)
let direction = [0,1,2,3]
var max_Value = 0


func swipeRight() {
    for i in board.indices {
        for j in board[i].indices.reversed() {
            if j == n-1 || board[i][j] == 0{
                continue
            } else {
                for r in j+1..<n {
                    if board[i][r] == 0 {
                        board[i][r] = board[i][r-1]
                        board[i][r-1] = 0
                        if isMerged[i][r-1] {
                            isMerged[i][r] = isMerged[i][r-1]
                            isMerged[i][r-1] = false
                        }
                    } else if isMerged[i][r-1] == true && board[i][r] == board[i][r-1] {
                        continue
                    } else if isMerged[i][r] == false && board[i][r] == board[i][r-1] {
                        isMerged[i][r] = true
                        board[i][r] *= 2
                        board[i][r-1] = 0
                    }
                }
            }
        }
    }
    isMerged = Array(repeating: Array(repeating: false, count: n), count: n)
}


func swipeLeft() {
    for i in board.indices {
        for j in board[i].indices {
            if j == 0 || board[i][j] == 0{
                continue
            } else {
                for l in (0...j-1).reversed() {
                    if board[i][l] == 0 {
                        board[i][l] = board[i][l+1]
                        board[i][l+1] = 0
                        if isMerged[i][l+1] {
                            isMerged[i][l] = isMerged[i][l+1]
                            isMerged[i][l+1] = false
                        }
                    } else if isMerged[i][l+1] == true && board[i][l] == board[i][l+1] {
                        continue
                    } else if isMerged[i][l] == false && board[i][l] == board[i][l+1] {
                        isMerged[i][l] = true
                        board[i][l] *= 2
                        board[i][l+1] = 0
                    }
                }
            }
        }
    }
    isMerged = Array(repeating: Array(repeating: false, count: n), count: n)
}

func swipeUp() {
    for i in board[0].indices {
        for j in board.indices {
            if j == 0 || board[j][i] == 0 {
                continue
            } else {
                for u in (0...j-1).reversed() {
                    if board[u][i] == 0 {
                        board[u][i] = board[u+1][i]
                        board[u+1][i] = 0
                        if isMerged[u+1][i] {
                            isMerged[u][i] = isMerged[u+1][i]
                            isMerged[u+1][i] = false
                        }
                    } else if isMerged[u+1][i] == true && board[u][i] == board[u+1][i] {
                        continue
                    } else if isMerged[u][i] == false && board[u][i] == board[u+1][i] {
                        isMerged[u][i] = true
                        board[u][i] *= 2
                        board[u+1][i] = 0
                    }
                }
            }
        }
    }
    isMerged = Array(repeating: Array(repeating: false, count: n), count: n)
}

func swipeDown() {
    for i in board[0].indices {
        for j in board.indices.reversed() {
            if j == n-1 || board[j][i] == 0{
                continue
            } else {
                for d in j+1..<n {
                    if board[d][i] == 0 {
                        board[d][i] = board[d-1][i]
                        board[d-1][i] = 0
                        if isMerged[d-1][i] {
                            isMerged[d][i] = isMerged[d-1][i]
                            isMerged[d-1][i] = false
                        }
                    } else if isMerged[d-1][i] == true && board[d][i] == board[d-1][i] {
                        continue
                    } else if isMerged[d][i] == false && board[d][i] == board[d-1][i] {
                        isMerged[d][i] = true
                        board[d][i] *= 2
                        board[d-1][i] = 0
                    }
                }
            }
        }
    }
    isMerged = Array(repeating: Array(repeating: false, count: n), count: n)
}

func dfs(_ cnt: Int) {
    for i in direction {
        let tmp = board
        switch i {
        case 0: swipeUp()
        case 1: swipeDown()
        case 2: swipeLeft()
        case 3: swipeRight()
        default : return
        }
        if cnt == 5 {
            for b in board {
                max_Value = max(max_Value,b.max()!)
            }
            board = tmp
            continue
        } else {
            dfs(cnt+1)
            board = tmp
        }
    }
}

dfs(1)
print(max_Value)
