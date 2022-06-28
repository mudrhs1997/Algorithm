import Foundation

let nm = readLine()!.components(separatedBy: " ").map{ Int($0)! }
var map = [[Int]]()
var virus_Map = map
var q = [(Int,Int)]()
var cnt = 0
var max = 0
var sum = 0
for _ in 0..<nm[0] {
    map.append(readLine()!.components(separatedBy: " ").map{ Int($0)! })
}

let x = [0,1,0,-1]
let y = [1,0,-1,0]

func wall(_ cnt: Int) {
    if cnt == 3 {
        virus_Map = map
        for i in virus_Map.indices {
            for j in virus_Map[i].indices {
                dfs((i,j))
            }
        }
        findSpace()
        sum = 0
    } else {
        for i in map.indices {
            for j in map[i].indices {
                if map[i][j] == 1 || map[i][j] == 2 {
                    continue
                } else {
                    map[i][j] = 1
                    wall(cnt+1)
                    map[i][j] = 0
                }
                
            }
        }
    }
}

func dfs(_ w: (Int, Int)) {
    if virus_Map[w.0][w.1] == 1 || virus_Map[w.0][w.1] == 0{
        return
    } else if virus_Map[w.0][w.1] == 2 {
        for i in x.indices {
            if 0 > w.0+y[i] || nm[0]-1 < w.0+y[i] || 0 > w.1+x[i] || nm[1]-1 < w.1+x[i] {
                continue
            } else if virus_Map[w.0+y[i]][w.1+x[i]] == 0 {
                virus_Map[w.0+y[i]][w.1+x[i]] = 2
                dfs((w.0+y[i],w.1+x[i]))
            }
        }
    }
}

func findSpace() {
    for i in virus_Map.indices {
        for j in virus_Map[i].indices {
            if virus_Map[i][j] == 0 {
                sum += 1
            }
        }
    }
    if max < sum {
        max = sum
    }
}

wall(cnt)

print(max)