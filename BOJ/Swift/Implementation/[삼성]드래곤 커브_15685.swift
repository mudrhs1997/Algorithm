import Foundation

let n = Int(String(readLine()!))!
var curves = [[Int]]()
var points = Array(repeating: Array(repeating: false, count: 102), count: 102)
var current = [Int]()
let x = [0,1,1]
let y = [1,0,1]
var answer = 0
for _ in 0..<n {
    curves = [[Int]]()
    let xydg = readLine()!.split(separator: " ").map{Int(String($0))!}
    if xydg[2] == 0 {
        curves += [[xydg[0],xydg[1]],[xydg[0]+1,xydg[1]]]
    } else if xydg[2] == 1 {
        curves += [[xydg[0],xydg[1]],[xydg[0],xydg[1]-1]]
    } else if xydg[2] == 2 {
        curves += [[xydg[0],xydg[1]],[xydg[0]-1,xydg[1]]]
    } else if xydg[2] == 3 {
        curves += [[xydg[0],xydg[1]],[xydg[0],xydg[1]+1]]
    }
    
    curve(xydg[3])
}

func curve(_ g: Int) {
    if g == 0 {
        for i in curves {
            points[i[1]][i[0]] = true
        }
    }
    for _ in 0..<g {
        current = curves.last!
        for i in (0...curves.count-2).reversed() {
            let x = curves[i][0]-current[0]
            let y = curves[i][1]-current[1]
            curves += [[-y+current[0],x+current[1]]]
            
        }
    }
    
    curves.forEach { c in
        points[c[1]][c[0]] = true
    }
}

for i in points.indices {
    for j in points[i].indices {
        if points[j][i] {
            var check = false
            for k in 0...2 {
                if !points[j+x[k]][i+y[k]] {
                    check = false
                    break
                }
                check = true
            }
            if check {
                answer += 1
            }
        }
    }
}

print(answer)

