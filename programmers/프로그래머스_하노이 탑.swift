// 해설 확인한 문제

import Foundation

var move = [[Int]]()

func solution(_ n:Int) -> [[Int]] {
    hanoi(n, 1, 3, 2)
    return move
}

func hanoi(_ num: Int, _ start: Int, _ target: Int, _ via: Int) {
    if num == 1 {
        move += [[start, target]]
        return
    }
    hanoi(num-1, start, via, target)
    move += [[start, target]]
    hanoi(num-1, via, target, start)
}