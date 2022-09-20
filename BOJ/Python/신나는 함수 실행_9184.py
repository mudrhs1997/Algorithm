import  sys

memo = [[[-1]*21 for _ in range(21)]*21 for _ in range(21)]

def dp(a, b, c):
    if a <= 0 or b <= 0 or c <= 0:
        return 1
    if a > 20 or b > 20 or c > 20:
        if memo[20][20][20] == -1:
            memo[20][20][20] = dp(20, 20, 20)
        return memo[20][20][20]
    if memo[a][b][c] != -1:
        return memo[a][b][c]
    if a < b and b < c:
        if memo[a][b][c] == -1:
            memo[a][b][c] = dp(a, b, c-1) + dp(a, b-1, c-1) - dp(a, b-1, c)
        return memo[a][b][c]

    memo[a][b][c] = dp(a-1, b, c) + dp(a-1, b-1, c) + dp(a-1, b, c-1) - dp(a-1, b-1, c-1)
    return memo[a][b][c]

while True:
    abc = list(map(int, sys.stdin.readline().split()))
    if abc == [-1, -1, -1]:
        break
    print("w({}, {}, {}) = {}".format(abc[0], abc[1], abc[2], dp(abc[0], abc[1], abc[2])))