from collections import deque

def solution(board):
    answer = -1
    newBoard = []
    rowLength = len(board[0])
    colLength = len(board)
    visited = [[-1 for _ in range(101)] for _ in range(101)]
    robot = []

    x = [1, -1, 0, 0]
    y = [0, 0, 1, -1]
    
    for point_y, row in enumerate(board):
        b = list(row)
        newBoard.append(b)
        for point_x, column in enumerate(b):
            if column == "R":
                robot = [point_y, point_x]
                visited[point_y][point_x] = 0
            
    queue = deque([robot])
    while queue:
        dy, dx = queue.popleft()
        for i in range(4):
            if 0 <= dy+y[i] < colLength and 0 <= dx+x[i] < rowLength:
                num = 1
                
                while 0 <= dy+y[i]*num < colLength and 0 <= dx+x[i]*num < rowLength and board[dy+y[i]*num][dx+x[i]*num] != "D":
                    num += 1
                num -= 1
                
                if visited[dy+y[i]*num][dx+x[i]*num] != -1 and visited[dy+y[i]*num][dx+x[i]*num] < visited[dy][dx] + 1:
                    continue
                elif board[dy+y[i]*num][dx+x[i]*num] == "G":
                    return visited[dy][dx] + 1
                else:
                    visited[dy+y[i]*num][dx+x[i]*num] = visited[dy][dx] + 1
                    queue.append([dy+y[i]*num, dx+x[i]*num])
    
    return answer


    