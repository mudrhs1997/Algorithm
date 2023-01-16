import sys

sys.setrecursionlimit(10**5)
v = int(sys.stdin.readline())
tree = [[] for _ in range(v+1)]
memo = [False for _ in range(v+1)]
maxValue = [0,0]

for _ in range(v-1):
    node = list(map(int, sys.stdin.readline().split()))
    tree[node[0]].append((node[1], node[2]))
    tree[node[1]].append((node[0], node[2]))

def dfs(node, sum):
    global maxValue
    if memo[node]:
        return
    memo[node] = True
    for n in tree[node]:
        dfs(n[0], sum+n[1])
    if maxValue[1] < sum:
        maxValue[1] = sum
        maxValue[0] = node

dfs(1, 0)
memo = [False for _ in range(v+1)]
dfs(maxValue[0], 0)
print(maxValue[1])
