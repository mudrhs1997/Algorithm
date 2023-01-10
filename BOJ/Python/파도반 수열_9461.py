import sys

t = int(sys.stdin.readline())
memo = [0,1,1,1,2,2]
for i in range(6, 101):
    memo.append(memo[i-1]+memo[i-5])

for _ in range(t):
    n = int(sys.stdin.readline())
    print(memo[n])