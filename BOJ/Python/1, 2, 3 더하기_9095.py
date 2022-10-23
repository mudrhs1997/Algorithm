import sys

n = int(sys.stdin.readline())
num = []
memo = [0 for i in range(12)]
for _ in range(n):
    num.append(int(sys.stdin.readline()))

def findNum(n, sum):
    if sum > n:
        return
    if sum == n:
        memo[n] += 1
        return
    for i in range(1,4):
        findNum(n, sum+i)

for i in num:
    findNum(i, 0)
    print(memo[i])

