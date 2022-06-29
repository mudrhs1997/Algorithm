import Foundation

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let startPoint = readLine()!.components(separatedBy: " ").map { Int($0)! }
var map = [[Int]]()
for _ in 0..<nm[0] {
    map.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
}
let x = [0,1,0,-1]
let y = [-1,0,1,0]
var turn = 0
var cnt = 0

func clean(_ robot: (Int, Int), _ dir: Int) {
    if map[robot.0][robot.1] == 0 {
        map[robot.0][robot.1] = 2
        cnt += 1
        turn = 0
    }
    if turn == 4 && map[robot.0+y[(dir+2)%4]][robot.1+x[(dir+2)%4]] == 1 {
        return
    } else if turn == 4 && (map[robot.0+y[(dir+2)%4]][robot.1+x[(dir+2)%4]] == 0 || map[robot.0+y[(dir+2)%4]][robot.1+x[(dir+2)%4]] == 2) {
        turn = 0
        clean((robot.0+y[(dir+2)%4],robot.1+x[(dir+2)%4]), dir)
    } else if map[robot.0+y[(dir+3)%4]][robot.1+x[(dir+3)%4]] == 0 {
        turn += 1
        clean((robot.0+y[(dir+3)%4],robot.1+x[(dir+3)%4]),(dir+3)%4)
    } else if map[robot.0+y[(dir+3)%4]][robot.1+x[(dir+3)%4]] == 2 || map[robot.0+y[(dir+3)%4]][robot.1+x[(dir+3)%4]] == 1 {
        turn += 1
        clean((robot.0,robot.1),(dir+3)%4)
    } else {
        
    }
}

clean((startPoint[0],startPoint[1]),startPoint[2])

print(cnt)


