import sys

board = []
empty = []
answer = False

for i in range(9):
    x = list(map(int, sys.stdin.readline().split()))
    for idx, j in enumerate(x):
        if j == 0:
            empty.append((i,idx))
    board.append(x)

def dfs(idx,cnt):
    global answer
    if answer == True:
        return
    for num in range(1,10):
        check = True
        bound_x = 3*int((idx[1]/3))
        bound_y = 3*int((idx[0]/3))
        for i in range(0,9):
            if board[idx[0]][i] == num or board[i][idx[1]] == num:
                check = False
                break
        for y in range(bound_y,bound_y+3):
            for x in range(bound_x,bound_x+3):
                if board[y][x] == num:
                    check = False
                    break
        if check:
            board[idx[0]][idx[1]] = num
            if cnt == len(empty)-1:
                answer = True
                for i in board:
                    print(*i)
            else:
                dfs(empty[cnt+1],cnt+1)
                board[idx[0]][idx[1]] = 0

dfs(empty[0],0)
