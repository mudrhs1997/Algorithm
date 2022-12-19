import sys
from collections import deque

sys.setrecursionlimit(10**5)
n, k = map(int, sys.stdin.readline().split())
queue = deque([(n,0)])
visited = [False for _ in range(100001)]

while queue:
    loc = queue.popleft()
    if loc[0] < 0 or loc[0] > 100000 or visited[loc[0]]:
        continue
    if loc[0] == k:
        print(loc[1])
        break

    visited[loc[0]] = True
    for i in range(3):
        if i == 0:
            queue.append((loc[0]+1, loc[1]+1))
        if i == 1:
            queue.append((loc[0]-1, loc[1]+1))
        if i == 2:
            queue.append((loc[0]*2, loc[1]+1))