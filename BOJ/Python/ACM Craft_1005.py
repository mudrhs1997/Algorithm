import sys

sys.setrecursionlimit(10**5)
t = int(sys.stdin.readline())

def getSum(node):
    if xy[node] == []:
        visited[node] = d[node-1]
        return visited[node]
    if visited[node] != -1:
        return visited[node]
    if visited[node] == -1:
        for i in xy[node]:
            visited[node] = max(getSum(i)+d[node-1], visited[node])
        return visited[node]


for _ in range(t):
    n, k = map(int, sys.stdin.readline().split())
    d = list(map(int, sys.stdin.readline().split()))
    xy = [[] for _ in range(n+1)]
    visited = [-1 for _ in range(n+1)]
    for _ in range(k):
        x, y = map(int, sys.stdin.readline().split())
        xy[y].append(x)
    w = int(sys.stdin.readline())
    getSum(w)
    print(visited[w])
