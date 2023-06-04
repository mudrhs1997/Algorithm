import sys

t = int(sys.stdin.readline())
board = [[0 for _ in range(101)] for _ in range(101)]
answer = 0

for i in range(t):
    x, y = map(int, sys.stdin.readline().split())

    for w in range(10):
        for h in range(10):
            board[x+w][y+h] = 1

for i in board:
    for j in i:
        if j == 1:
            answer += 1

print(answer)import sys

t = int(sys.stdin.readline())
board = [[0 for _ in range(101)] for _ in range(101)]
answer = 0

for i in range(t):
    x, y = map(int, sys.stdin.readline().split())

    for w in range(10):
        for h in range(10):
            board[x+w][y+h] = 1

for i in board:
    for j in i:
        if j == 1:
            answer += 1

print(answer)