import sys
from collections import deque

sys.setrecursionlimit(10**4)
n, m = map(int, sys.stdin.readline().split())
memo = [[0, 0] for _ in range(101)]
queue = deque([])

for _ in range(n):
    x, y = map(int, sys.stdin.readline().split())
    memo[x][1] = y
for _ in range(m):
    u, v = map(int, sys.stdin.readline().split())
    memo[u][1] = v

queue.append((0, 1))

while queue:
    if memo[100][0] != 0:
        break
    point = queue.popleft()
    for i in range(1, 7):
        dx = point[1]+i
        if dx > 100:
            continue
        if memo[dx][0] == 0:
            if memo[dx][1] != 0:
                memo[point[1]] = [point[0] + 1, memo[dx][1]]
                queue.append((point[0] + 1, memo[dx][1]))
                continue
            memo[dx] = [point[0]+1, dx]
            queue.append((point[0]+1, dx))

print(memo[100][0])