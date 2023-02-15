import sys
from collections import deque

n = int(sys.stdin.readline())

board = []
memo = deque()
cal = [-1, 0, 1]

for i in range(n):
    board = list(map(int, sys.stdin.readline().split()))
    if i == 0:
        memo.append([[board[j], board[j]] for j in range(3)])
        continue
    memo.append([[memo[0][j][0], sys.maxsize] for j in range(3)])
    for j in range(3):
        for k in cal:
            preNode = j+k
            if 0 <= preNode < 3:
                memo[1][j][0] = max(memo[1][j][0], memo[0][preNode][0]+board[j])
                memo[1][j][1] = min(memo[1][j][1], memo[0][preNode][1]+board[j])
    memo.popleft()

result = memo.popleft()

maxValue = 0
minValue = sys.maxsize
for i in range(3):
    if maxValue < result[i][0]:
        maxValue = result[i][0]
    if minValue > result[i][1]:
        minValue = result[i][1]

print(maxValue, minValue)
