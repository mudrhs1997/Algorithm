import sys

sys.setrecursionlimit(10**5)
n, m = map(int, sys.stdin.readline().split())

graph = [[] for _ in range(n+1)]
visited = [False for _ in range(n+1)]
flag = False
result = 0

for _ in range(m):
    a, b = map(int, sys.stdin.readline().split())
    graph[a].append(b)
    graph[b].append(a)


def dfs(nd):
    global flag
    if visited[nd]:
        return
    visited[nd] = True
    flag = True
    for idx in graph[nd]:
        dfs(idx)


for i in range(1, n+1):
    dfs(i)
    if flag:
        result += 1
        flag = False

print(result)
