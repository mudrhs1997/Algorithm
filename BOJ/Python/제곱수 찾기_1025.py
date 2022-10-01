import sys
from itertools import product
import math

n, m = map(int,sys.stdin.readline().split())
board = [list(sys.stdin.readline().strip()) for _ in range(n)]
product = list(product(range(-n,n),range(-m,m)))
answer = -1

def checkSqur(product,point):
    global answer
    x , y = point[1], point[0]
    num = ''


    if product[1] == 0 and product[0] == 0:
        return 0

    while 0 <= x < m and 0 <= y < n:
        num += board[y][x]
        x += product[1]
        y += product[0]

        check = list(str(int(num) ** (1 / 2)).split('.'))
        if check[1] == '0':
            answer = max(answer, int(num))


for i in range(n):
    for j in range(m):
        for p in product:
            checkSqur(p, [i,j])

print(answer)