import sys
import copy


# new_matrix = [row[:] for row in origin_matrix]

r, c, t = map(int, sys.stdin.readline().split())
dustMap = [list(map(int, sys.stdin.readline().split())) for _ in range(r)]
currentDust = copy.deepcopy(dustMap)
answer = 0

for _ in range(t):
    # dustMap = spreadDust(dustMap)
    dx = [1, -1, 0, 0]
    dy = [0, 0, 1, -1]
    for i, row in enumerate(dustMap):
        for j, value in enumerate(row):
            if value > 0:
                sum = 0
                for k in range(4):
                    ny, nx = i + dy[k], j + dx[k]
                    if 0 <= ny < len(dustMap) and 0 <= nx < len(dustMap[0]):
                        if dustMap[ny][nx] == -1:
                            continue
                        currentDust[ny][nx] += value // 5
                        sum += 1
                currentDust[i][j] -= (value // 5) * sum

    # dustMap = runningEco(dustMap)
    num = 0
    for d in range(r):
        if currentDust[d][0] == -1:
            if num == 0:
                dy = [0, -1, 0, 1]
                dx = [1, 0, -1, 0]
                num = 1
            elif num == 1:
                dy = [0, 1, 0, -1]
                dx = [1, 0, -1, 0]
            cy = d
            cx = 0
            value = [0]
            for i in range(4):
                ny, nx = cy + dy[i], cx + dx[i]
                while 0 <= cy < r and 0 <= cx < c:
                    if ny < 0 or ny == r or nx < 0 or nx == c:
                        break
                    if currentDust[ny][nx] == -1:
                        break

                    value.append(currentDust[ny][nx])
                    currentDust[ny][nx] = value[len(value)-2]

                    ny += dy[i]
                    nx += dx[i]
                    cy += dy[i]
                    cx += dx[i]

    dustMap = [row[:] for row in currentDust]

for i in currentDust:
    for j in i:
        if j == -1:
            continue
        answer += j


print(answer)

