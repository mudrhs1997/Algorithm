import Foundation

var quad = [[Int]]()
var result = [0,0]

func solution(_ arr:[[Int]]) -> [Int] {
    quad = arr
    var length = arr.count
    check(0,0,length)
    
    return result
}

func check(_ idxX: Int, _ idxY: Int, _ len: Int) {
    let num = quad[idxY][idxX]
    for y in idxY..<idxY+len {
        for x in idxX..<idxX+len {
            if quad[y][x] != num {
                let newLength = len/2
                check(idxX,idxY,newLength)
                check(idxX+newLength,idxY+newLength,newLength)
                check(idxX,idxY+newLength,newLength)
                check(idxX+newLength,idxY,newLength)
                return
            }
        }
    }
    result[num] += 1
}