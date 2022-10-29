import sys

sys.setrecursionlimit(2**10)
n = int(sys.stdin.readline())
apart = []
visited = [[False for _ in range(n)] for _ in range(n)]
x = [1,-1,0,0]
y = [0,0,1,-1]
result = []
count = 1
for i in range(n):
    apart.append(list(sys.stdin.readline().strip()))

def dfs(idx):
    global count
    visited[idx[0]][idx[1]] = True
    for i in range(4):
        dy, dx = idx[0]+y[i], idx[1]+x[i]
        if 0 <= dy < n and 0 <= dx < n:
            if apart[dy][dx] == '0' or visited[dy][dx] == True:
                continue
            if apart[dy][dx] == '1':
                count += 1
                dfs((dy,dx))

for i in range(n):
    for j in range(n):
        if apart[i][j] == '1' and visited[i][j] == False:
            dfs((i,j))
            result.append(count)
            count = 1

print(len(result))
for i in sorted(result):
    print(i)