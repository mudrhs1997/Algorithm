import Foundation

let N = Int(String(readLine()!))!
var memo = [Int]()
var works = [[0,0]]
for _ in 0..<N {
    works += [readLine()!.split(separator: " ").map{Int(String($0))!}]
}

for i in 1...N {
    work(i, 0)
}

func work(_ idx: Int, _ cnt: Int) {
    if idx > N || idx+works[idx][0]-1 > N {
        memo += [cnt]
        return
    }
    
    for i in 0...N-1{
        work(idx+works[idx][0]+i, cnt+works[idx][1])
    }
}

print(memo.max()!)
