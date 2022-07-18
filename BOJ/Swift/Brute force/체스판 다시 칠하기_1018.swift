import Foundation

let nm = readLine()!.components(separatedBy: " ").map{ Int($0)! }
var board = [[String]]()
for _ in 0..<nm[0] {
    var y = [String]()
    String(readLine()!).forEach { color in
        y.append(String(color))
    }
    board.append(y)
}
var newBoard = Array(repeating: Array(repeating: "", count: 8), count: 8)
var value = 0
var result = 987654321

for i in 0...nm[0]-8 {
    for j in 0...nm[1]-8 {
        for n in 0..<8 {
            for m in 0..<8 {
                newBoard[n][m] = board[n+i][m+j]
            }
        }
        
        coloring(newBoard)
    }
}

func coloring(_ b: [[String]]) {
    // 0,0 == B
    for i in 0..<8 {
        if i % 2 == 0 {
            for j in 0..<8 {
                if j % 2 == 0 {
                    if b[i][j] == "B" {
                        continue
                    } else {
                        value += 1
                    }
                } else {
                    if b[i][j] == "W" {
                        continue
                    } else {
                        value += 1
                    }
                }
            }
        } else {
            for j in 0..<8 {
                if j % 2 == 0 {
                    if b[i][j] == "W" {
                        continue
                    } else {
                        value += 1
                    }
                } else {
                    if b[i][j] == "B" {
                        continue
                    } else {
                        value += 1
                    }
                }
            }
        }
    }
    result = min(value, result)
    value = 0
    
    // 0,0 == W
    for i in 0..<8 {
        if i % 2 == 0 {
            for j in 0..<8 {
                if j % 2 == 0 {
                    if b[i][j] == "W" {
                        continue
                    } else {
                        value += 1
                    }
                } else {
                    if b[i][j] == "B" {
                        continue
                    } else {
                        value += 1
                    }
                }
            }
        } else {
            for j in 0..<8 {
                if j % 2 == 0 {
                    if b[i][j] == "B" {
                        continue
                    } else {
                        value += 1
                    }
                } else {
                    if b[i][j] == "W" {
                        continue
                    } else {
                        value += 1
                    }
                }
            }
        }
    }
    result = min(value, result)
    value = 0
}

print(result)
