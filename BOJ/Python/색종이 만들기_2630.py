import sys

n = int(sys.stdin.readline())
sqrt = 0
board = []
paper = [0, 0]
for _ in range(n):
    board.append(list(map(int, sys.stdin.readline().split())))
while n != 1:
    sqrt += 1
    n /= 2

def getNumOfPaper(idx, s):
    for i in range(idx[0],idx[0]+2**s):
        for j in range(idx[1],idx[1]+2**s):
            if board[idx[0]][idx[1]] != board[i][j]:
                getNumOfPaper((idx[0], idx[1]), s - 1)
                getNumOfPaper((idx[0]+2**(s-1),idx[1]), s-1)
                getNumOfPaper((idx[0],idx[1]+2**(s-1)), s-1)
                getNumOfPaper((idx[0]+2**(s-1),idx[1]+2**(s-1)), s-1)
                return
    paper[board[idx[0]][idx[1]]] += 1

getNumOfPaper((0, 0), sqrt)
for i in paper:
    print(i)