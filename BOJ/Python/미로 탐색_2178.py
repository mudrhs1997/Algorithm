import sys
from collections import deque

n, m = map(int, sys.stdin.readline().split())
maze = []
visited = [[0 for _ in range(m)] for _ in range(n)]
x = [1, -1, 0, 0]
y = [0, 0, 1, -1]
queue = deque([(0,0)])
for _ in range(n):
    maze.append(list(sys.stdin.readline().strip()))

def bfs():
    while queue:
        idx = queue.popleft()
        for i in range(4):
            ny, nx = idx[0]+y[i], idx[1]+x[i]
            if 0 <= ny < n and 0 <= nx < m:
                if visited[ny][nx] != 0:
                    continue
                if maze[ny][nx] == "1":
                    queue.append((ny, nx))
                    visited[ny][nx] = visited[idx[0]][idx[1]] + 1

visited[0][0] = 1
bfs()

print(visited[n-1][m-1])