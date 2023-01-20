import sys

n = int(sys.stdin.readline())
node = []
visited = [False for _ in range(n+1)]
result = [0 for _ in range(n)]

for _ in range(n):
    node.append(list(map(int, sys.stdin.readline().split())))

def dfs(num):
    for idx, isConnet in enumerate(node[num]):
        if visited[idx]:
            continue
        if isConnet == 1:
            visited[idx] = True
            result[idx] = 1
            dfs(idx)

for i in range(n):
    dfs(i)
    for j in result:
        print(j, end=" ")
    print("")
    visited = [False for _ in range(n + 1)]
    result = [0 for _ in range(n)]