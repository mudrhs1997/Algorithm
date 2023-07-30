# 230730 15:03 ~ 15:18
# 최단경로 (Dynamic Programming, BFS)

from collections import deque

def solution(n, roads, sources, destination):
    answer = []
    edges = [[] for _ in range(n+1)]
    memo = [123456789 for _ in range(n+1)]
    queue = deque([destination])
    memo[destination] = 0
    
    for road in roads:
        start, end = road
        edges[start].append(end)
        edges[end].append(start)
    
    while queue:
        cnode = queue.popleft()
        for edge in edges[cnode]:
            if memo[edge] > memo[cnode] + 1:
                memo[edge] = memo[cnode] + 1
                queue.append(edge)

    for source in sources:
        if memo[source] == 123456789:
            answer.append(-1)
            continue
        answer.append(memo[source])
    
    return answer