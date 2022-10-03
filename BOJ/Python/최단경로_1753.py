import sys
import heapq

INF = sys.maxsize
v, e = list(map(int, sys.stdin.readline().split()))
k = int(sys.stdin.readline())
graph = [[] for _ in range(v)]
queue = []
node = [INF for _ in range(v)]

def dijk(start):
    node[start] = 0
    heapq.heappush(queue, (0,start))

    while queue:
        w, n = heapq.heappop(queue)

        if node[n] < w:
            continue

        for weight, next_node in graph[n]:
            next_weight = w + weight
            if next_weight < node[next_node]:
                node[next_node] = next_weight
                heapq.heappush(queue, (next_weight, next_node))



for i in range(e):
    start, end, weight = map(int, sys.stdin.readline().split())
    graph[start-1].append((weight,end-1))

dijk(k-1)

for i in node:
    print('INF' if i == INF else i)
