import sys

sys.setrecursionlimit(10 ** 5)

n = int(sys.stdin.readline())
m = int(sys.stdin.readline())
road = [[] for _ in range(n+1)]
memo = [sys.maxsize for _ in range(n+1)]
visited = [False for _ in range(n+1)]


for _ in range(m):
    a, b, c = map(int, sys.stdin.readline().split())
    road[a].append((b, c))

start, end = map(int,sys.stdin.readline().split())

def find():
    node = (0, sys.maxsize)
    for idx, value in enumerate(memo):
        if visited[idx]:
            continue
        if value < node[1]:
            node = (idx, value)
    return node

def dijk(s):
    visited[s[0]] = True
    for i in road[s[0]]:
        memo[i[0]] = min(memo[i[0]],i[1]+s[1])
    findNode = find()
    if findNode[0] == 0:
        return
    else :
        dijk(findNode)

dijk((start, 0))

print(memo[end])