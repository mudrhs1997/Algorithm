import sys

n, m = map(int, sys.stdin.readline().split())
arr = list(map(int, sys.stdin.readline().split()))
memo = [0 for _ in range(n+1)]
result = 0
for i in range(n):
    result += arr[i]
    memo[i+1] = result

for i in range(m):
    i, j = map(int, sys.stdin.readline().split())
    print(memo[j]-memo[i-1])