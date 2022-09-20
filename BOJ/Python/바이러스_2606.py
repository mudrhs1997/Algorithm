import  sys

n = int(sys.stdin.readline())
graph = [[] for _ in range(n+1)]
visited = [False]*101
m = int(sys.stdin.readline())
result = -1

for i in range(m):
    node = list(map(int,sys.stdin.readline().split()))
    graph[node[0]].append(node[1])
    graph[node[1]].append(node[0])

def dfs(node):
    global result

    if visited[node]:
        return

    visited[node] = True
    result += 1

    for i in graph[node]:
        dfs(i)


dfs(1)
print(result)