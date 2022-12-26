import sys
from collections import deque

sys.setrecursionlimit(10**7)
m, n ,h = map(int, sys.stdin.readline().split())
box = [[[0 for _ in range(m)] for _ in range(n)] for _ in range(h)]
queue = deque()
x = [1, -1, 0, 0]
y = [0, 0, 1, -1]
result = 0

for k in range(h):
    for i in range(n):
        box[k][i] = list(map(int, sys.stdin.readline().split()))
        for idx, j in enumerate(box[k][i]):
            if j == 1:
                queue.append((k, i, idx, 0))

while queue:
    t = queue.popleft()
    result = max(result, t[3])
    if 0 <= t[0]-1:
        if box[t[0]-1][t[1]][t[2]] == 0:
            queue.append((t[0]-1, t[1], t[2], t[3]+1))
            box[t[0]-1][t[1]][t[2]] = 1

    if t[0]+1 < h:
        if box[t[0]+1][t[1]][t[2]] == 0:
            queue.append((t[0]+1, t[1], t[2], t[3]+1))
            box[t[0]+1][t[1]][t[2]] = 1

    for i in range(4):
        dy = t[1]+y[i]
        dx = t[2]+x[i]
        if 0 <= dy < n and 0 <= dx < m:
            if box[t[0]][dy][dx] == 0:
                queue.append((t[0], dy, dx, t[3]+1))
                box[t[0]][dy][dx] = 1

for k in box:
    for i in k:
        for j in i:
            if j == 0:
                result = -1
                break

print(result)