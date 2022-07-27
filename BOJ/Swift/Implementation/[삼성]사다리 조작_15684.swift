import Foundation

let nmh = readLine()!.split(separator: " ").map{Int(String($0))!}
var lines = Array(repeating: Array(repeating: 0, count: nmh[0]+1), count: nmh[2])
var result = 4

if nmh[1] > 0 {
    for _ in 0..<nmh[1] {
        let l = readLine()!.split(separator: " ").map{Int(String($0))!}
        lines[l[0]-1][l[1]] = l[1]+1
        lines[l[0]-1][l[1]+1] = l[1]
    }
} else {
    print(0)
    exit(0)
}

func ladder(_ cnt: Int) {
    for i in 1..<lines[0].count {
        var s = i
        for j in lines.indices {
            if lines[j][s] == 0 {
                continue
            } else {
                s = lines[j][s]
            }
        }
        if s != i {
            return
        }
    }
    result = min(cnt,result)
}

func dfs(_ cnt: Int, x: Int, y: Int) {
    if cnt >= result {
        return
    } else {
        ladder(cnt)
        if cnt == 3 {
            return
        }
    }
    for i in y..<lines.count {
        let current = i == y ? x : 1
        for j in current...lines[0].count-2 {
            if lines[i][j] == 0 && lines[i][j+1] == 0 {
                lines[i][j] = j+1
                lines[i][j+1] = j
            } else {
                continue
            }
            dfs(cnt+1, x: j, y: i)
            lines[i][j] = 0
            lines[i][j+1] = 0
        }
    }
}

dfs(0,x: 1,y: 0)
print(result < 4 ? result : -1)

