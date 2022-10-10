import sys
from collections import deque

INF = sys.maxsize
n, m = map(int, sys.stdin.readline().split())
map = []
visited = [[[INF,INF] for _ in range(m)] for _ in range(n)]
x = [1,0,0,-1]
y = [0,1,-1,0]
queue = deque([])

for _ in range(n):
    map.append(list(sys.stdin.readline().strip()))

def bfs():
    queue.append((0,0,0))
    while queue:
        idx = queue.popleft()
        for i in range(4):
            nx, ny, check = idx[0]+x[i], idx[1]+y[i], idx[2]
            if 0 <= nx < m and 0 <= ny < n:
                if map[ny][nx] == '1' and check == 0:
                    visited[ny][nx][1] = visited[idx[1]][idx[0]][check] + 1
                    queue.append((nx,ny,1))
                    continue
                if map[ny][nx] == '0' and visited[ny][nx][check] == INF:
                    if check == 1 and visited[ny][nx][0] != INF:
                        continue
                    visited[ny][nx][check] = visited[idx[1]][idx[0]][check] + 1
                    queue.append((nx,ny,check))

visited[0][0][0] = 1
bfs()
print(-1 if (visited[n-1][m-1][0] == INF and visited[n-1][m-1][1] == INF) else min(visited[n-1][m-1][0],visited[n-1][m-1][1]))