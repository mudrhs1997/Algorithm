import Foundation

let NxM = readLine()!.components(separatedBy: " ").map{Int($0)!}
var paper = [[Int]]()
for _ in 0..<NxM[0] {
    let y = readLine()!.components(separatedBy: " ").map{Int($0)!}
    paper.append(y)
}

let x = [1,0,-1,0]
let y = [0,-1,0,1]
var visited = [(Int, Int)]()
var max = -1

func dfs(idx: Int, pointer: (Int, Int), sum: Int) {
    if pointer.0 < 0 || pointer.0 > NxM[0]-1 || pointer.1 < 0 || pointer.1 > NxM[1]-1 || visited.contains(where: {$0.0 == pointer.0 && $0.1 == pointer.1}) {
        return
    } else {
        if idx == 1 {
            for i in 0..<NxM[0] {
                for j in 0..<NxM[1] {
                    for k in 0..<4 {
                        visited.append((i,j))
                        anotherShape((i,j), paper[i][j])
                        dfs(idx: idx+1, pointer: (i+x[k],j+y[k]), sum: sum+paper[i][j])
                        visited.removeLast()
                    }
                }
            }
        } else if idx == 4 {
            if max < sum+paper[pointer.0][pointer.1] {
                max = sum+paper[pointer.0][pointer.1]
            }
        } else {
            for i in 0..<4 {
                visited.append((pointer.0,pointer.1))
                dfs(idx: idx+1, pointer: (pointer.0+x[i],pointer.1+y[i]), sum: sum+paper[pointer.0][pointer.1])
                visited.removeLast()
            }
        }
    }
}

func anotherShape(_ pointer: (Int,Int), _ sum: Int) {
    for i in 0..<4 {
        var check = 0
        let a = (pointer.0+x[i],pointer.1+y[i])
        for j in 0..<4 {
            if pointer.0+x[j] == a.0 && pointer.1+y[j] == a.1 {
            } else if pointer.0+x[j] < 0 || pointer.0+x[j] > NxM[0]-1 || pointer.1+y[j] < 0 || pointer.1+y[j] > NxM[1]-1 {
            } else {
                check += paper[pointer.0+x[j]][pointer.1+y[j]]
            }
        }
        if max < sum+check {
            max = sum+check
        }
    }
}

dfs(idx: 1, pointer: (0,0), sum: 0)

print(max)
