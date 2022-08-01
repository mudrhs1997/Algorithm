import Foundation

var wall = [[Int]]()
var time = Array(repeating: [[Int]](), count: 9)
var check = true
var x = [1,0,-1,1,-1,1,-1]
var y = [0,0,0,-1,-1,1,1]
for i in 0..<8 {
    let b = readLine()!
    var c = 0
    for j in b{
        if j == "#" {
            wall += [[i,c]]
        }
        c += 1
    }
}
if wall.isEmpty {
    print(1)
    exit(0)
}

time[0].append([7,0])

for i in 0...7 {
    if time[i].isEmpty {
        check = false
        break
    }
    time[i].forEach { t in
        move(t[1],t[0],i)
    }
    wall = wall.map{[$0[0]+1,$0[1]]}
    
}

print(check ? 1 : 0)


func move(_ currentX: Int, _ currentY: Int, _ t: Int) {
    var memo = [[Int]]()
    for i in 0...6 {
        if currentX+x[i] > 7 || currentX+x[i] < 0 || wall.contains([currentY+y[i],currentX+x[i]]) || currentY+y[i] > 7 {
            continue
        }
        if wall.contains([currentY+y[i]-1,currentX+x[i]]) {
            continue
        }
        memo += [[currentY+y[i],currentX+x[i]]]
    }
    time[t+1] += memo
}
