from collections import deque

def solution(maps):

    mapArray = [list(row) for row in maps]
    start = findPoint(mapArray, "S")
    labber = findPoint(mapArray, "L")
    goLabber = bfs(mapArray, start, "L")
    goExit = bfs(mapArray, labber, "E")

    if goLabber != 0 and goExit != 0 :
        return goLabber + goExit
    else:
        return -1
    

def bfs(maps, start, destination):
    x = [1, -1, 0, 0]
    y = [0, 0, 1, -1]
    countMap = [[0 for _ in range(len(maps[0]))] for _ in range(len(maps))]
    route = deque([start])
    while route:
        location = route.popleft()
        for i in range(4):
            dy = location[0] + y[i]
            dx = location[1] + x[i]
            if 0 <= dy < len(maps) and 0 <= dx < len(maps[1]):
                if countMap[dy][dx] > 0 or maps[dy][dx] == maps[start[0]][start[1]]:
                    continue
                if maps[dy][dx] == destination:
                    return countMap[location[0]][location[1]] + 1
                if maps[dy][dx] != "X":
                    countMap[dy][dx] = countMap[location[0]][location[1]] + 1
                    route.append([dy, dx])
    return 0
    
def findPoint(maps, point):
    for i in range(len(maps)):
        for j, value in enumerate(maps[i]):
            if value == point:
                return [i, j]
            