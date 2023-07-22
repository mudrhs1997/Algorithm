import copy
from collections import deque

def solution(maps):
    rowLength = len(maps[0])
    colLength = len(maps)
    arrMap = [list(i) for i in maps]
    visitedMap = [[0 for _ in range(rowLength)] for _ in range(colLength)]
    dy = [1, -1, 0, 0]
    dx = [0, 0, 1, -1]
    queue = deque([])
    result = []
    
    for i in range(colLength):
        for j in range(rowLength):
            if arrMap[i][j] != "X" and visitedMap[i][j] != 1:
                queue.append([i, j])
                visitedMap[i][j] = 1
                islandFood = 0
                while queue:
                    cy, cx = queue.popleft()
                    islandFood += int(arrMap[cy][cx])
                    for n in range(4):
                        ny = cy + dy[n]
                        nx = cx + dx[n]
                        if 0 <= ny < colLength and 0 <= nx < rowLength:
                            if arrMap[ny][nx] != "X" and visitedMap[ny][nx] != 1:
                                queue.append([ny, nx])
                                visitedMap[ny][nx] = 1
                result.append(islandFood)
                                
    if result == []:
        return [-1]
    else:
        return sorted(result)