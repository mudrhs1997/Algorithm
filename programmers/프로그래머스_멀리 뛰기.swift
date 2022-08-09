func solution(_ n:Int) -> Int {
    var memo = [1,2]
    for i in 1...n {
        memo += [(memo[i]+memo[i-1])%1234567]
    }
    return memo[n-1]
}