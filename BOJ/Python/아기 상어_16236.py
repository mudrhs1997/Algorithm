import sys
from collections import deque

n = int(sys.stdin.readline())
sea = []
visited = [[0 for _ in range(n)] for _ in range(n)]
x = [0,-1,1,0]
y = [-1,0,0,1]
memo = []
idx = (0,0)
queue = deque([])
weight = 2
count = 0
result = 0
check = True
distance = 0

for cy in range(n):
    row = list(map(int, sys.stdin.readline().split()))
    for cx, shark in enumerate(row):
        if shark == 9:
            idx = (cy,cx)
    sea.append(row)

def bfs():
    global idx, distance
    while queue:
        idx = queue.popleft()
        for i in range(4):
            ny, nx = idx[0]+y[i], idx[1]+x[i]
            if 0 <= ny < n and 0 <= nx < n:
                value = visited[idx[0]][idx[1]] + 1
                if (sea[ny][nx] > weight or visited[ny][nx] > 0) or (distance != 0 and value > distance):
                    continue

                if 0 <= sea[ny][nx] <= weight and visited[ny][nx] == 0:
                    visited[ny][nx] = value
                    if 0 < sea[ny][nx] < weight:
                        memo.append((ny,nx))
                        distance = value
                    else:
                        queue.append((ny,nx))

sea[idx[0]][idx[1]] = 0
while True:
    queue.append(idx)
    visited[idx[0]][idx[1]] = 1
    bfs()
    if len(memo) > 0:
        memo = sorted(memo)
        result += visited[memo[0][0]][memo[0][1]] -1
        sea[memo[0][0]][memo[0][1]] = 0
        if weight-1 == count:
            weight += 1
            count = 0
        else :
            count += 1
        idx = (memo[0][0], memo[0][1])
        visited = [[0 for _ in range(n)] for _ in range(n)]
        memo = []
        distance = 0
    else:
        break

print(result)