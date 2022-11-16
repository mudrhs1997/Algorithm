import sys
import heapq

n, m, x = map(int, sys.stdin.readline().split())
INF = sys.maxsize
viliage = [[] for _ in range(n)]
result = 0

for w in range(m):
    start, end, weight = map(int, sys.stdin.readline().split())
    viliage[start-1].append((weight,end-1))

def dijk(start):
    heap = []
    memo = [INF for _ in range(n)]
    heapq.heappush(heap, (0, start))
    memo[start] = 0
    while heap:
        node = heapq.heappop(heap)

        if memo[node[1]] < node[0]:
            continue

        for no in viliage[node[1]]:
            if memo[node[1]]+no[0] < memo[no[1]]:
                memo[no[1]] = memo[node[1]]+no[0]
                heapq.heappush(heap, no)

    return memo

destination = dijk(x-1)
for i in range(n):
    if i == x-1:
        continue
    result = max(result, dijk(i)[x-1]+destination[i])

print(result)