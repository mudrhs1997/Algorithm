import Foundation

var arr = [[Int]]()
var cnt = 1

func solution(_ n:Int) -> [Int] {
    arr = Array(repeating: Array(repeating: 0, count: n), count: n)
    var currentSize = n
    var idx = [0,0]
    
    while currentSize>0 {
        triangle(idx, currentSize)
        currentSize -= 3
        idx = [idx[0]+1,idx[1]+2]
    }
    

    return arr.joined().filter{$0>0}
}

func triangle(_ idx: [Int], _ n: Int) {
    for i in 0..<n {
        arr[idx[1]+i][idx[0]] = cnt
        cnt += 1
    }
    if n == 1 {
        return
    }
    for i in 1...n-1 {
        arr[idx[1]+n-1][idx[0]+i] = cnt
        cnt += 1
    }
    if n == 2 {
        return
    }
    for j in 1...n-2 {
        arr[idx[1]+n-1-j][idx[0]+n-1-j] = cnt
        cnt += 1
    }
}