import Foundation

let N = Int(readLine()!)!
var map = Array(repeating: Array(repeating: 0, count: N+2), count: N+2)
let K = Int(readLine()!)!
if K > 0 {
    for _ in 0..<K {
        let apple = readLine()!.components(separatedBy: " ").map{Int($0)!}
        map[apple[0]][apple[1]] = 1
    }
}
let L = Int(readLine()!)!
var turn = Array(repeating: "", count: 10001)
for _ in 1...L {
    let turnInfo = readLine()!.components(separatedBy: " ")
    turn[Int(turnInfo[0])!] = turnInfo[1]
}

var direction = 2
var visited = [(0,0)]

func dummy(snake: (Int, Int), time: Int) -> Int{
    if snake.0 > N || snake.0 < 1 || snake.1 > N || snake.1 < 1 {
        return time
    } else if visited.contains(where: {$0.0 == snake.0 && $0.1 == snake.1}) {
        return time
    } else {
        if turn[time] != "" {
            if turn[time] == "L" {
                if direction == 1 {
                    direction = 4
                } else {
                    direction -= 1
                }
            } else if turn[time] == "D" {
                if direction == 4 {
                    direction = 1
                } else {
                    direction += 1
                }
            }
        }
        if map[snake.0][snake.1] == 0 {
            visited.append((snake.0,snake.1))
            visited.removeFirst()
        } else {
            visited.append((snake.0,snake.1))
            map[snake.0][snake.1] = 0
        }
        if direction == 1 {
            return dummy(snake: (snake.0-1,snake.1), time: time+1)
        } else if direction == 2 {
            return dummy(snake: (snake.0,snake.1+1), time: time+1)
        } else if direction == 3 {
            return dummy(snake: (snake.0+1,snake.1), time: time+1)
        } else {
            return dummy(snake: (snake.0,snake.1-1), time: time+1)
        }
    }
    
}


print(dummy(snake: (1,1), time: 0))
