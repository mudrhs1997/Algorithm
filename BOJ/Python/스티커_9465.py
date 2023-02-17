import sys

t = int(sys.stdin.readline())

for _ in range(t):
    n = int(sys.stdin.readline())
    board = [list(map(int, sys.stdin.readline().split())) for _ in range(2)]

    for i in range(1, n):
        if i == 1:
            board[0][i] += board[1][i-1]
            board[1][i] += board[0][i-1]
            continue
        board[0][i] += max(board[1][i-1], board[1][i-2])
        board[1][i] += max(board[0][i-1], board[0][i-2])

    print(max(board[0][n-1], board[1][n-1]))
