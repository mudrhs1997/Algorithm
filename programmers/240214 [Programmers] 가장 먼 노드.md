---
title: '240214 [Programmers] 가장 먼 노드'
created: '2024-02-14T11:46:42.188Z'
modified: '2024-02-14T11:47:12.304Z'
---

# 240214 [Programmers] 가장 먼 노드
``` Solved by BFS ```

```python
from collections import deque

def solution(n, edge):
    graph = [[] for _ in range(n+1)]
    cache = [-1 if i == 1 else 0 for i in range(n+1)]
    queue = deque([[1, 0]])
    maxCount = 0
    
    for fnode, snode in edge:
        graph[fnode].append(snode)
        graph[snode].append(fnode)
    
    while queue:
        node, count = queue.popleft()
        maxCount = max(maxCount, count)
        for nextNode in graph[node]:
            if cache[nextNode] != 0:
                continue
            cache[nextNode] = count + 1
            queue.append([nextNode, count+1])
            
    return len(list(filter(lambda x:x==maxCount, cache)))
```
