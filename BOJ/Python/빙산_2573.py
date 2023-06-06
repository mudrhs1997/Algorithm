import sys
from collections import deque

n, m = map(int, sys.stdin.readline().split())
answer = 0
sea = [list(map(int, sys.stdin.readline().split())) for _ in range(n)]
dx = [1, -1, 0, 0]
dy = [0, 0, 1, -1]


def check():
    num = 0
    visited = [[False for _ in range(m)] for _ in range(n)]
    for i in range(n):
        for j in range(m):
            if sea[i][j] > 0 and not visited[i][j]:
                num += 1
                if num > 1:
                    return num
                queue = deque([[i, j]])
                visited[i][j] = True
                while queue:
                    current = queue.popleft()
                    for seq in range(4):
                        y = current[0] + dy[seq]
                        x = current[1] + dx[seq]
                        if 0 <= x < m and 0 <= y < n:
                            if sea[y][x] > 0 and not visited[y][x]:
                                visited[y][x] = True
                                queue.append([y, x])
    return num


def melting():
    visited = [[False for _ in range(m)] for _ in range(n)]
    for i in range(n):
        for j in range(m):
            if sea[i][j] > 0:
                num = 0
                for seq in range(4):
                    x = j + dx[seq]
                    y = i + dy[seq]
                    if 0 <= x < m and 0 <= y < n:
                        if sea[y][x] == 0 and not visited[y][x]:
                            num += 1
                sea[i][j] = max(sea[i][j]-num, 0)
                visited[i][j] = True


while True:
    melting()
    answer += 1
    y = check()
    if y == 2:
        print(answer)
        break
    elif y == 0:
        print(0)
        break
