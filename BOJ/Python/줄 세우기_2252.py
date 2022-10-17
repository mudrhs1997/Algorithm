# 위상정렬

import sys
from collections import deque

n, m = map(int, sys.stdin.readline().split())
nodes = [[] for _ in range(n+1)]
degree = [0 for _ in range(n+1)]
visited = [False for _ in range(n+1)]
queue = deque([])
result = []

for _ in range(m):
    a, b = map(int, sys.stdin.readline().split())
    nodes[a].append(b)
    degree[b] += 1

for i in range(1,n+1):
    if degree[i] == 0:
        queue.append(i)

while queue:
    node = queue.popleft()
    result.append(str(node))
    for n in nodes[node]:
        degree[n] -= 1
        if degree[n] == 0:
            queue.append(n)

print(*result)
