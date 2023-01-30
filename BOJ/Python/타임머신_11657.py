import sys

n, m = map(int, sys.stdin.readline().split())
graph = []
memo = [sys.maxsize for _ in range(n+1)]

for _ in range(m):
    a, b, c = map(int, sys.stdin.readline().split())
    graph.append((a, b, c))


# Bellman-Ford -> 음수 간선이 존재하는 그래프의 최단 경로를 구하는 알고리즘
def bellman_ford(start):
    memo[start] = 0
    for i in range(n):
        for j in range(m):
            cur_node = graph[j][0]
            next_node = graph[j][1]
            cost = graph[j][2]
            if memo[cur_node] != sys.maxsize and memo[next_node] > memo[cur_node] + cost :
                memo[next_node] = memo[cur_node] + cost
                if i == n-1:
                    return True
    return False

cycle = bellman_ford(1)

if cycle:
    print(-1)
else:
    for i in range(2, n+1):
        if memo[i] == sys.maxsize:
            print(-1)
        else:
            print(memo[i])