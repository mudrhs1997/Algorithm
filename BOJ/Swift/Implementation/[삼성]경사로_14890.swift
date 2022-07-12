import Foundation

var nl = readLine()!.components(separatedBy: " ").map{ Int($0)! }
var map = [[Int]]()
var cnt = 0
var height = 0
var length = 1
var isLoad = true
for _ in 0..<nl[0] {
    map.append(readLine()!.components(separatedBy: " ").map{ Int($0)! })
}

for i in 0..<nl[0] {
    height = map[i][0]
    length = 1
    isLoad = true
    for j in 1..<nl[0] {
        if height == map[i][j] {
            length += 1
        } else if abs(height - map[i][j]) > 1 {
            isLoad = false
            break
        } else if height - map[i][j] == -1 {
            if length < nl[1] {
                isLoad = false
                break
            } else {
                height = map[i][j]
                length = 1
            }
        } else if height - map[i][j] == 1 {
            if j+nl[1]-1 > nl[0]-1 {
                isLoad = false
                break
            } else {
                for len in j...j+nl[1]-1 {
                    if map[i][j] != map[i][len] {
                        isLoad = false
                        break
                    }
                    height = map[i][j]
                    length = -nl[1]+1
                }
            }
        }
    }
    if isLoad {
        cnt += 1
    }
}

for i in 0..<nl[0] {
    height = map[0][i]
    length = 1
    isLoad = true
    for j in 1..<nl[0] {
        if height == map[j][i] {
            length += 1
        } else if abs(height - map[j][i]) > 1 {
            isLoad = false
            break
        } else if height - map[j][i] == -1 {
            if length < nl[1] {
                isLoad = false
                break
            } else {
                height = map[j][i]
                length = 1
            }
        } else if height - map[j][i] == 1 {
            if j+nl[1]-1 > nl[0]-1 {
                isLoad = false
                break
            } else {
                length = 0
                for len in j...j+nl[1]-1 {
                    if map[j][i] != map[len][i] {
                        isLoad = false
                        break
                    }
                    height = map[j][i]
                    length = -nl[1]+1
                }
            }
        }
    }
    if isLoad {
        cnt += 1
    }
}

print(cnt)
