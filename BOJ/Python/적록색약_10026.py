import sys
from collections import deque

n = int(sys.stdin.readline())
paint = [list(sys.stdin.readline().strip()) for _ in range(n)]
visited = [[False for _ in range(n)] for _ in range(n)]
x = [1,-1,0,0]
y = [0,0,1,-1]
queue = deque([])
result = [0,0]

def bfs(point, color):
    global check
    for i in range(4):
        if 0 <= point[0]+y[i] < n and 0 <= point[1]+x[i] < n and not visited[point[0]+y[i]][point[1]+x[i]] :
            if paint[point[0]+y[i]][point[1]+x[i]] != color:
                continue
            else:
                queue.append([point[0] + y[i], point[1] + x[i]])
                visited[point[0]+y[i]][point[1]+x[i]] = True

for i in range(n):
    for j in range(n):
        if not visited[i][j]:
            queue.append([i,j])
            visited[i][j] = True
            while queue:
                bfs(queue.popleft(), paint[i][j])
            result[0] += 1

for i in range(n):
    for j in range(n):
        visited[i][j] = False
        if paint[i][j] == 'G':
            paint[i][j] = 'R'

for i in range(n):
    for j in range(n):
        if not visited[i][j]:
            queue.append([i,j])
            visited[i][j] = True
            while queue:
                bfs(queue.popleft(), paint[i][j])
            result[1] += 1

print(result[0], result[1])
