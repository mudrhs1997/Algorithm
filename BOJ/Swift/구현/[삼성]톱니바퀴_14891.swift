import Foundation

var gearwheels = [[Int]]()
for _ in 0...3 {
    var g = readLine()!.map{ String($0) }
    var gearwheel = [Int]()
    for _ in 0...7 {
        gearwheel.append(Int(g.removeFirst())!)
    }
    gearwheels.append(gearwheel)
}
let n = Int(readLine()!)!
var visited = Array(repeating: false, count: 4)
var result = 0
for _ in 0..<n {
    let turnGear = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    visited = Array(repeating: false, count: 4)
    turnGearwheel(turnGear[0]-1, turnGear[1])
}

for i in 0...3 {
    if gearwheels[i][0] == 1 {
        result += Int(pow(2.0, Double(i)))
    }
}

func turnGearwheel(_ num: Int, _ dir: Int) {
    visited[num] = true
    if num == 0 {
        if dir == 1 {
            if gearwheels[num][2] != gearwheels[num+1][6] {
                if visited[num+1] == false {
                    turnGearwheel(num+1, -1)
                }
            }
            turnRight(num)
        } else if dir == -1 {
            if gearwheels[num][2] != gearwheels[num+1][6] {
                if visited[num+1] == false {
                    turnGearwheel(num+1, 1)
                }
            }
            turnLeft(num)
        }
    } else if num == 3 {
        if dir == 1 {
            if gearwheels[num][6] != gearwheels[num-1][2] {
                if visited[num-1] == false {
                    turnGearwheel(num-1, -1)
                }
            }
            turnRight(num)
        } else if dir == -1 {
            if gearwheels[num][6] != gearwheels[num-1][2] {
                if visited[num-1] == false {
                    turnGearwheel(num-1, 1)
                }
            }
            turnLeft(num)
        }
    } else {
        if dir == 1 {
            if gearwheels[num][2] != gearwheels[num+1][6] {
                if visited[num+1] == false {
                    turnGearwheel(num+1, -1)
                }
            }
            if gearwheels[num][6] != gearwheels[num-1][2] {
                if visited[num-1] == false {
                    turnGearwheel(num-1, -1)
                }
            }
            turnRight(num)
        } else if dir == -1 {
            if gearwheels[num][2] != gearwheels[num+1][6] {
                if visited[num+1] == false {
                    turnGearwheel(num+1, 1)
                }
            }
            if gearwheels[num][6] != gearwheels[num-1][2] {
                if visited[num-1] == false {
                    turnGearwheel(num-1, 1)
                }
            }
            turnLeft(num)
        }
    }
    
}


func turnRight(_ num: Int) {
    let gear = gearwheels[num].removeLast()
    gearwheels[num].insert(gear, at: 0)
    
}

func turnLeft(_ num: Int) {
    let gear = gearwheels[num].removeFirst()
    gearwheels[num].append(gear)
}


print(result)
