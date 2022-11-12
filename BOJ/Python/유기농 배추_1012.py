import sys

sys.setrecursionlimit(2**10)
t = int(sys.stdin.readline())
x = [1, -1, 0, 0]
y = [0, 0, -1, 1]
m, n, k = 0, 0, 0
count = 0
farm = []
visited = []

def dfs(idxX, idxY):
    visited[idxY][idxX] = True
    for i in range(4):
        dx, dy = idxX+x[i], idxY+y[i]
        if 0 <= dx < n and 0 <= dy < m:
            if farm[dy][dx] == 0 or visited[dy][dx]:
                continue
            dfs(dx, dy)

for _ in range(t):
    n, m, k = map(int,sys.stdin.readline().split())
    visited = [[False for _ in range(n)] for _ in range(m)]
    farm = [[0 for _ in range(n)] for _ in range(m)]
    for i in range(k):
        idxX, idxY = map(int, sys.stdin.readline().split())
        farm[idxY][idxX] = 1
    for i in range(m):
        for j in range(n):
            if farm[i][j] == 1 and visited[i][j] == False:
                dfs(j, i)
                count += 1
    print(count)
    count = 0
