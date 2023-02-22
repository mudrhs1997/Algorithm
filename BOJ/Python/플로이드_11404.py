import sys

n = int(sys.stdin.readline())
m = int(sys.stdin.readline())

bus = [[sys.maxsize for _ in range(n)] for _ in range(n)]

for _ in range(m):
    a, b, c = map(int, sys.stdin.readline().split())
    bus[a-1][b-1] = min(bus[a-1][b-1], c)

def floid(idx, via, sum):
    for i in range(n):
        if i == idx or i == via:
            continue
        if bus[via][i] != sys.maxsize:
            if bus[idx][i] >= sum+bus[via][i]:
                bus[idx][i] = min(bus[idx][i], sum+bus[via][i])
                floid(idx, i, sum+bus[via][i])

for i in range(n):
    floid(i, i, 0)
    for j in bus[i]:
        if j == sys.maxsize:
            print(0, end=" ")
        else:
            print(j, end=" ")
    print("")
