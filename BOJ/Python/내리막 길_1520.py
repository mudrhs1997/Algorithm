import sys

sys.setrecursionlimit(10**5)
n, m = map(int, sys.stdin.readline().split())
mountain = []
visited = [[0 for _ in range(m)] for _ in range(n)]
x = [-1,0,0,1]
y = [0,-1,1,0]
for _ in range(n):
    mountain.append(list(map(int, sys.stdin.readline().split())))
result = 0

def dp(idx):
    if idx[0] == 0 and idx[1] == 0:
        return 1
    if visited[idx[0]][idx[1]] != 0:
        if visited[idx[0]][idx[1]] == -1:
            return 0
        return visited[idx[0]][idx[1]]
    sum = 0
    for i in range(4):
        dy, dx = idx[0]+y[i], idx[1]+x[i]
        if 0 <= dy < n and 0 <= dx < m:
            if mountain[dy][dx] > mountain[idx[0]][idx[1]]:
                sum += dp((dy,dx))
    if sum == 0:
        visited[idx[0]][idx[1]] = -1
        return 0
    else :
        visited[idx[0]][idx[1]] = sum
        return sum

print(dp((n-1,m-1)))