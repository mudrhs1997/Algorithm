import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var movedBoard = board
    var basket = [0]
    var result = 0

    for move in moves {
        for i in 0..<board.count {
            if movedBoard[i][move-1] != 0 {
                if basket.last == movedBoard[i][move-1] {
                    result += 1
                    basket.removeLast()
                } else {
                    basket.append(movedBoard[i][move-1])
                }

                movedBoard[i][move-1] = 0
                break
            }
        }

    }
    return result*2
}