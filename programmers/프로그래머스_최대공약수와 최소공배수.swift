import Foundation

var result: [Int] = [Int]()

var arr: [Int] = [3, 12]
arr.sort(by: >)

func gcd(_ n: Int, _ m: Int) -> Int {
    if(m == 0) {
        return n
    } else {
        return gcd(m, n%m)
    }
}

result.append(gcd(n, m))
result.append(n*m/gcd(n,m))

print(result)



