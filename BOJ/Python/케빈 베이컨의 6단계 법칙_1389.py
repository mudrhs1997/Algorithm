import sys

n, m = map(int, sys.stdin.readline().split())
board = [[] for _ in range(n)]
visited = [sys.maxsize for _ in range(n)]
result = sys.maxsize
answer = 0

for _ in range(m):
    start, end = map(int, sys.stdin.readline().split())
    board[start-1].append(end-1)
    board[end-1].append(start-1)

def dfs(node, num):
    global result
    if visited[node] <= num:
        return
    visited[node] = num
    for i in board[node]:
        dfs(i, num+1)

for i in range(n):
    dfs(i,0)
    sum = 0
    for j in visited:
        sum += j
    if sum < result:
        result = sum
        answer = i
    visited = [sys.maxsize for _ in range(n)]

print(answer+1)