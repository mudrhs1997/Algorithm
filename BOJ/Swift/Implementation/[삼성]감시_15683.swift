import Foundation

var nm = readLine()!.components(separatedBy: " ").map{ Int($0)! }
var map = Array(repeating: Array(repeating: "0", count: nm[1]), count: nm[0])
var cctv = [(String, Int, Int)]()
let manual = [[[]],[[1],[2],[3],[4]],[[1,2],[3,4]],[[1,4],[1,3],[2,3],[2,4]],[[1,2,3],[2,3,4],[1,3,4],[1,2,4]],[[1,2,3,4]]]
var result = 987654321
for i in 0..<nm[0] {
    let c = readLine()!.components(separatedBy: " ")
    for j in 0..<nm[1] {
        if c[j] != "0" && c[j] != "6" {
            map[i][j] = c[j]
            cctv.append((c[j],i,j))
        } else {
            map[i][j] = c[j]
        }
    }
}

func dfs(_ cnt: Int) {
    let tmp = map
    if !cctv.isEmpty {
        if cctv[cnt].0 == "1" {
            for m in manual[1] {
                for i in m {
                    check((cctv[cnt].1, cctv[cnt].2), i)
                }
                if cnt == cctv.count-1 {
                    var c = 0
                    for i in map {
                        for j in i {
                            if j == "0" {
                                c += 1
                            }
                        }
                    }
                    result = min(result, c)
                } else {
                    dfs(cnt+1)
                }
                
                map = tmp
            }
        } else if cctv[cnt].0 == "2" {
            for m in manual[2] {
                for i in m {
                    check((cctv[cnt].1, cctv[cnt].2), i)
                }
                if cnt == cctv.count-1 {
                    var c = 0
                    for i in map {
                        for j in i {
                            if j == "0" {
                                c += 1
                            }
                        }
                    }
                    result = min(result, c)
                } else {
                    dfs(cnt+1)
                }
                
                map = tmp
            }
        } else if cctv[cnt].0 == "3" {
            for m in manual[3] {
                for i in m {
                    check((cctv[cnt].1, cctv[cnt].2), i)
                }
                if cnt == cctv.count-1 {
                    var c = 0
                    for i in map {
                        for j in i {
                            if j == "0" {
                                c += 1
                            }
                        }
                    }
                    result = min(result, c)
                } else {
                    dfs(cnt+1)
                }
                
                map = tmp
            }
        } else if cctv[cnt].0 == "4" {
            for m in manual[4] {
                for i in m {
                    check((cctv[cnt].1, cctv[cnt].2), i)
                }
                if cnt == cctv.count-1 {
                    var c = 0
                    for i in map {
                        for j in i {
                            if j == "0" {
                                c += 1
                            }
                        }
                    }
                    result = min(result, c)
                } else {
                    dfs(cnt+1)
                }
                
                map = tmp
            }
        } else if cctv[cnt].0 == "5" {
            
            for m in manual[5] {
                for i in m {
                    check((cctv[cnt].1, cctv[cnt].2), i)
                }
                if cnt == cctv.count-1 {
                    var c = 0
                    for i in map {
                        for j in i {
                            if j == "0" {
                                c += 1
                            }
                        }
                    }
                    result = min(result, c)
                } else {
                    dfs(cnt+1)
                }
                
                map = tmp
            }
        }
    } else {
        var c = 0
        for i in map {
            for j in i {
                if j == "0" {
                    c += 1
                }
            }
        }
        result = min(result, c)
    }
}
    
    
func check(_ p: (Int, Int), _ dir: Int) {
    if dir == 1 {
        if p.1 != nm[1]-1 {
            for i in p.1+1..<nm[1] {
                if map[p.0][i] == "6" {
                    return
                } else if map[p.0][i] == "0" {
                    map[p.0][i] = "#"
                }
            }
        }
    } else if dir == 2 {
        if p.1 != 0 {
            for i in (0...p.1-1).reversed() {
                if map[p.0][i] == "6" {
                    return
                } else if map[p.0][i] == "0" {
                    map[p.0][i] = "#"
                }
            }
        }
    } else if dir == 3 {
        if p.0 != nm[0]-1 {
            for i in p.0+1..<nm[0] {
                if map[i][p.1] == "6" {
                    return
                } else if map[i][p.1] == "0" {
                    map[i][p.1] = "#"
                }
            }
        }
    } else if dir == 4 {
        if p.0 != 0 {
            for i in (0...p.0-1).reversed() {
                if map[i][p.1] == "6" {
                    return
                } else if map[i][p.1] == "0" {
                    map[i][p.1] = "#"
                }
            }
        }
    }
}

dfs(0)
print(result)
