import Foundation

// 내 풀이 (dp)

let INF = 99
var memo = [Int]()

func solution(_ n:Int) -> Int {
    memo = Array(repeating: INF, count: n+2)
    memo[1] = 1
    memo[2] = 1

    return dp(n)
}

func dp(_ n: Int) -> Int {
    if memo[n] != INF {
        return memo[n]
    }
    if n % 2 == 0 {
        memo[n] = min(memo[n],dp(n/2))
        return memo[n]
    }
        
    memo[n] = min(memo[n],dp(n-1)+1)
    return memo[n]
}

// 통과한 풀이

func solution(_ n:Int) -> Int {
    var count = 0
    var num = n
    while num > 0 {
        if num % 2 == 1 {
            num -= 1
            count += 1
            continue
        }
        num /= 2
    }

    return count
}