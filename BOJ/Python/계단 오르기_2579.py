import sys

sys.setrecursionlimit(10**5)
n = int(sys.stdin.readline())
stair = [0]
memo = [0 for _ in range(n+1)]

for i in range(n):
    stair.append(int(sys.stdin.readline()))

def dp():
    memo[1] = stair[1]
    for i in range(2,n+1):
        if i == 2:
            memo[i] = max(memo[i-1]+stair[i],memo[i-2]+stair[i])
            continue
        memo[i] = max(memo[i-3]+stair[i-1]+stair[i],memo[i-2]+stair[i])

dp()
print(memo[n])