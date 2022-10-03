import sys
from collections import deque

r, c = map(int, sys.stdin.readline().split())
board = []
visited = [False for _ in range(26)]
x = [1, -1, 0, 0]
y = [0, 0, 1, -1]
answer = 0

for _ in range(r):
    board.append(list(sys.stdin.readline().strip()))

def dfs(idx, cnt):
    global answer
    visited[ord(board[idx[1]][idx[0]])-65] = True
    answer = max(answer, cnt)
    for i in range(4):
        if 0 <= idx[0]+x[i] < c and 0 <= idx[1]+y[i] < r:
            if visited[ord(board[idx[1]+y[i]][idx[0]+x[i]])-65]:
                continue
            dfs((idx[0]+x[i],idx[1]+y[i]), cnt+1)
    visited[ord(board[idx[1]][idx[0]]) - 65] = False


dfs((0,0), 1)

print(answer)
