# 230730 15:21 ~ 17:45(2h 24m)
# Dynamic Programming

from collections import deque

def solution(n, paths, gates, summits):
    answers = []
    edges = [[] for _ in range(n+1)]
    memo = [[0, 10000001] for _ in range(n+1)]
    
    for path in paths:
        start, end, time = path
        edges[start].append([end, time])
        edges[end].append([start, time])
        
    for summit in summits:
        memo[summit][0] = -1
        
    for gate in gates:
        memo[gate][0] = -2
    
    for gate in gates:
        queue = deque([[gate, 0]])
        while queue:
            cnode, ctime = queue.popleft()
            if memo[cnode][0] == -1:
                answers.append([cnode, ctime])
                continue
            for edge in edges[cnode]:
                nnode, ntime = edge
                max_time = max(ctime, ntime)
                if memo[nnode][0] == -2:
                    continue
                if memo[nnode][1] <= max_time:
                    continue
                memo[nnode][1] = min(max_time, memo[nnode][1])
                queue.append([nnode, memo[nnode][1]])
    
    return sorted(answers, key = lambda x:(x[1], x[0]))[0] if answers else []