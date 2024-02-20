---
title: '240220 [Programmers] 합승 택시 요금'
created: '2024-02-20T05:37:26.918Z'
modified: '2024-02-20T05:38:04.139Z'
---

# 240220 [Programmers] 합승 택시 요금
``` Solved by Floyd-Warshall ```

```python
import sys

INF = sys.maxsize
def solution(n, s, a, b, fares):
    answer = INF
    graph = [[0 if i == j else INF for i in range(n+1)] for j in range(n+1)]
    cache = [[0 if i == j else INF for i in range(n+1)] for j in range(n+1)]
    visited = [False for _ in range(n+1)]
    
    for start, end, weight in fares:
        graph[start][end] = weight
        cache[start][end] = weight
        graph[end][start] = weight
        cache[end][start] = weight
        
    for k in range(n+1):
        for i in range(n+1):
            for j in range(n+1):
                cache[i][j] = min(cache[i][j], cache[i][k]+cache[k][j])
    
    for i in range(n+1):
        answer = min(answer, cache[s][i] + cache[i][a] + cache[i][b])
    
    return answer
```
