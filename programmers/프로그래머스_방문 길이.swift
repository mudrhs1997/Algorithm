import Foundation

var map = Array(repeating: Array(repeating: [0,0,0,0], count: 11), count: 11)
var cnt = 0
let x = [0,1,0,-1]
let y = [1,0,-1,0]

func solution(_ dirs:String) -> Int {
    var character = [5,5]
    for d in dirs {
        if d == "U" {
            character = move(character,2)
        } else if d == "D" {
            character = move(character,0)
        } else if d == "R" {
            character = move(character,1)
        } else if d == "L" {
            character = move(character,3)
        }
    }
    return cnt
}

func move(_ c: [Int], _ dir: Int) -> [Int] {
    if c[0]+x[dir] < 0 || c[0]+x[dir] > 10
    || c[1]+y[dir] < 0 || c[1]+y[dir] > 10 {
        return c
    }
    if map[c[1]][c[0]][dir] != 0 {
        return [c[0]+x[dir],c[1]+y[dir]]
    }
    map[c[1]][c[0]][dir] = 1
    map[c[1]+y[dir]][c[0]+x[dir]][(dir+2)%4] = 1
    cnt += 1
    return [c[0]+x[dir],c[1]+y[dir]]
}
