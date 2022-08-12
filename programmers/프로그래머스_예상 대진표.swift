import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var cnt = 0
    var ab = [a,b]
    while abs(ab[0]-ab[1]) != 0 {
        ab[0] = ab[0] % 2 == 0 ? ab[0]/2 : (ab[0]+1)/2
        ab[1] = ab[1] % 2 == 0 ? ab[1]/2 : (ab[1]+1)/2
        cnt += 1
    }

    return cnt
}