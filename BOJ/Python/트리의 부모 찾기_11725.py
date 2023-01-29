import sys

sys.setrecursionlimit(10**8)
n = int(sys.stdin.readline())
tree = list(range(n+1))
memo = [[] for _ in range(n+1)]

for _ in range(n-1):
    reaf1, reaf2 = map(int, sys.stdin.readline().split())
    memo[reaf1].append(reaf2)
    memo[reaf2].append(reaf1)

def setTree(num):
    for i in memo[num]:
        if i == tree[num]:
            continue
        tree[i] = num
        setTree(i)

setTree(1)

for i in range(2, n+1):
    print(tree[i])