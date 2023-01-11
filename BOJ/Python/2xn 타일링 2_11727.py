import sys

n = int(sys.stdin.readline())
memo = [0 for _ in range(n+1)]

def dp(num):
    if num == 1:
        memo[num] = 1
        return memo[num]
    if num == 2:
        memo[num] = 3
        return memo[num]
    if memo[num] != 0:
        return memo[num]
    memo[num] = dp(num-2)*2+dp(num-1)
    return memo[num]

print(dp(n)%10007)