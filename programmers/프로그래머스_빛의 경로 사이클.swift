import Foundation

var grids = [[Grid]]()
var length = [0,0]
var dir = [0,1,2,3]
var x = [1,0,-1,0]
var y = [0,-1,0,1]
var result = [Int]()

func solution(_ grid:[String]) -> [Int] {

    for i in grid {
        var g = [Grid]()
        for j in i {
            g += [Grid(direction: j)]
        }
        grids += [g]
    }
    
    length = [grids.count, grids[0].count]

    for i in grids.indices {
        for j in grids[i].indices {
            for k in 0..<4 {
                checkCycle(j,i,0,k)
            }
        }
    }
    
    return result.filter{$0 != 0}.sorted()
}

func checkCycle(_ currentX: Int, _ currentY: Int, _ cnt: Int, _ dir: Int) {
    let nextX = currentX+x[dir] == -1 ? length[1]-1 : (currentX+x[dir])%length[1]
    let nextY = currentY+y[dir] == -1 ? length[0]-1 : (currentY+y[dir])%length[0]
    if grids[currentY][currentX].out[dir] {
        result += [cnt]
        return
    }
    grids[currentY][currentX].out[dir] = true
    if grids[nextY][nextX].direction == "S" {
        checkCycle(nextX, nextY, cnt+1, dir)
    } else if grids[nextY][nextX].direction == "L" {
        checkCycle(nextX, nextY, cnt+1, (dir+1)%4)
    } else if grids[nextY][nextX].direction == "R" {
        checkCycle(nextX, nextY, cnt+1, dir-1 == -1 ? 3 : dir-1)
    }
    
}

struct Grid {
    let direction: Character
    var out = Array(repeating: false, count: 4)
    
    init(direction: Character){
        self.direction = direction
    }
}
