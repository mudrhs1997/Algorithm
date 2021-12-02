import Foundation

let N = Int(readLine()!)!
var corse = ""
var cnt = 0

func hanoiTower(_ n: Int, _ from: Int, _ tmp: Int, _ to: Int) {
    cnt += 1
    if n == 1 { corse += "\(from) \(to) \n" }
    else {
        hanoiTower(n-1, from, to, tmp);
        corse += "\(from) \(to) \n"
        hanoiTower(n-1, tmp, from, to)
    }
}

hanoiTower(N, 1, 2, 3)
print(cnt)
print(corse)

