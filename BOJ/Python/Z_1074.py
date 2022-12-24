import sys

sys.setrecursionlimit(10**7)
n, r, c = map(int, sys.stdin.readline().split())
cnt = 0


def recur(num, idx):
    global cnt
    x, y = 0, 0
    if idx == (r, c) or num == 0:
        print(int(cnt))
    else :
        if r >= idx[0] + 2 ** (num - 1):
            cnt += ((2 ** num) / 2) ** 2 * 2
            y = (2 ** num) / 2
        if c >= idx[1] + 2 ** (num - 1):
            cnt += ((2 ** num) / 2) ** 2
            x = (2 ** num) / 2
        recur(num-1, (idx[0]+y, idx[1]+x))

recur(n, (0, 0))